Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1SS7pc-0007HI-Bv
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 16:25:32 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q49EFclE023046
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 May 2012 07:15:38 -0700 (PDT)
Received: from [172.25.32.41] (172.25.32.41) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 9 May 2012 07:15:38 -0700
Message-ID: <4FAA7C09.7000404@windriver.com>
Date: Wed, 9 May 2012 09:15:37 -0500
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Koen Kooi
	<koen@dominion.thruhere.net>
References: <1336571192-15711-1-git-send-email-jason.wessel@windriver.com>
	<056CEBF9-AB73-43AB-ABFF-C511347BB8B3@dominion.thruhere.net>
In-Reply-To: <056CEBF9-AB73-43AB-ABFF-C511347BB8B3@dominion.thruhere.net>
X-Enigmail-Version: 1.4.1
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	q49EFclE023046
Subject: Re: [PATCH] .gitignore: add /bitbake to the ignore list for external distributions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 May 2012 14:25:32 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

On 05/09/2012 08:58 AM, Koen Kooi wrote:
>=20
> Op 9 mei 2012, om 15:46 heeft Jason Wessel het volgende geschreven:
>=20
>> External distributions based on the oe-core will typically include
>> bitbake in the top level directory.
>=20
> Really?
>=20


Certainly I cannot speak for everyone, but I would like to "attempt" esta=
blish some kind of standard and this forum is probably the best place to =
discuss it.  We would like to be able to assemble pristine git controlled=
 pieces that comprise what you find in the Yocto Project.  I believe that=
 Richard Purdie and Jeff Polk discussed this in a different forum and I w=
as trying to "clean up" the assembly so to speak.=20


>>
>> diff --git a/.gitignore b/.gitignore
>> index 04e36c5..366151c 100644
>> --- a/.gitignore
>> +++ b/.gitignore
>> @@ -1,3 +1,4 @@
>> +/bitbake
>=20
> Provided we want bitbake in here, shouldn't it be 'bitbake' to match th=
e rest of the file?


According to the git documentation, "man gitignore", you want the slash f=
or the following reason:

--- excerpt from man page ---
       =B7   If the pattern does not contain a slash /, git treats it as =
a shell
           glob pattern and checks for a match against the pathname relat=
ive
           to the location of the .gitignore file (relative to the toplev=
el of
           the work tree if not from a .gitignore file).
-----------------------------

In theory there should not be a reason we need to use a pattern match.

Cheers,
Jason.


