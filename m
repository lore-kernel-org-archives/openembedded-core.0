Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steve@sakoman.com>) id 1RrxyW-0002XU-8a
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 21:37:16 +0100
Received: by bkaq10 with SMTP id q10so3717703bka.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 12:29:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.204.129.200 with SMTP id p8mr9375048bks.114.1327955362854;
	Mon, 30 Jan 2012 12:29:22 -0800 (PST)
Received: by 10.204.35.135 with HTTP; Mon, 30 Jan 2012 12:29:22 -0800 (PST)
X-Originating-IP: [74.41.60.154]
In-Reply-To: <20120130200907.GB3244@ad.chargestorm.se>
References: <1327943665-16402-1-git-send-email-steve@sakoman.com>
	<1327943665-16402-3-git-send-email-steve@sakoman.com>
	<20120130200907.GB3244@ad.chargestorm.se>
Date: Mon, 30 Jan 2012 12:29:22 -0800
Message-ID: <CAOSpxdZ2Kk=iJvZYwhP_ff+PyUYiy+FoEpH5bJByPsaEL3ziBQ@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Steve Sakoman <steve@sakoman.com>
Subject: Re: [PATCH v3 2/3] gnupg: add recipe for 2.0.18
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
X-List-Received-Date: Mon, 30 Jan 2012 20:37:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 30, 2012 at 12:09 PM, Anders Darander <anders@chargestorm.se> wrote:
> * Steve Sakoman <steve@sakoman.com> [120130 20:20]:
>> GnuPG 2.0 is the new modularized version of GnuPG supporting OpenPGP and S/MIME
>
>> diff --git a/meta/recipes-support/gnupg/gnupg_2.0.18.bb b/meta/recipes-support/gnupg/gnupg_2.0.18.bb
>> new file mode 100644
>> index 0000000..c56f3d5
>> --- /dev/null
>> +++ b/meta/recipes-support/gnupg/gnupg_2.0.18.bb
>> @@ -0,0 +1,24 @@
>> +DESCRIPTION = "gnupg - GNU privacy guard"
>> +LICENSE = "GPLv2+"
>
> Are you sure about this?
>
> Looking at git.gnupg.org, this ought to be GPLv3+...

Fixed in next version.  Thanks!

Steve


