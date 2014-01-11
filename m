Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id C35716A467
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2014 15:11:48 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id hq4so1566965wib.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2014 07:11:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:content-transfer-encoding:message-id:references:to;
	bh=zu46Rqld7BZARJ56q3D6qDaK9bUuyJbTrjesCA+HZVs=;
	b=A380pfVa9lZtrjDTYnhuSCUiNVbiAEccMejGCq6NSbIJlovzS4CqSb3fEa2n+j3DSN
	bANMdmSWMpYIpD9AwztMse3g0TnH7Rok0qHtI+fUjAwXXPd6ur1mEl9Z2jDDXZVs1aNK
	EdXEZ2iuKKEve8potNUrRPS2U3yGk3q4nyduiJi5vFGsQ1su/2oxrYerMlgyqzGlgZjC
	E4VNYJCvYXJr9faZxdTRC0sYEn0+8536yw3I91hSyI/Nxr4FARbRTjs+h6pxZXySB7/n
	zO38nUmflq7nNaqVlFc89AkLSnYeZXqOrntDKDmMHfkQCZhcZj2YplaAgbUo3sN8ui4v
	VVbQ==
X-Gm-Message-State: ALoCoQlwLFs28pi3rfjElhZ5pxF4vfe8rZ5zktPCQqc30zr5nfSX5d9UchoyteLoKabidqRzsX7r
X-Received: by 10.195.13.234 with SMTP id fb10mr13828578wjd.50.1389453109313; 
	Sat, 11 Jan 2014 07:11:49 -0800 (PST)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id f9sm8088461wib.3.2014.01.11.07.11.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 11 Jan 2014 07:11:48 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <52D02516.3010503@windriver.com>
Date: Sat, 11 Jan 2014 16:11:46 +0100
Message-Id: <3DC864D6-0B66-4817-9304-4E9C2AC9BCCF@dominion.thruhere.net>
References: <cover.1389003637.git.Martin.Jansa@gmail.com>
	<52CF90CB.3010300@windriver.com> <1389350516.19102.206.camel@ted>
	<52D02516.3010503@windriver.com>
To: OE-core <openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1827)
Subject: Re: [dora][PATCH 0/2] Dora backports
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 11 Jan 2014 15:11:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 10 jan. 2014, om 17:51 heeft Mark Hatle <mark.hatle@windriver.com> =
het volgende geschreven:

> On 1/10/14, 4:41 AM, Richard Purdie wrote:
>> On Fri, 2014-01-10 at 14:18 +0800, Robert Yang wrote:
>>> Hi Martin,
>>>=20
>>> Thanks, please see my comments in line.
>>>=20
>>> On 01/06/2014 06:21 PM, Martin Jansa wrote:
>>>> The following changes since commit =
e86622a932bbd0acdea67ecfb15c8b06c27353d8:
>>>>=20
>>>>    libsoup-2.4: add intltool-native to DEPENDS (2013-12-19 14:59:47 =
+0000)
>>>>=20
>>>> are available in the git repository at:
>>>>=20
>>>>    git://git.openembedded.org/openembedded-core-contrib =
jansa/dora-backports2
>>>>    =
http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=3Dj=
ansa/dora-backports2
>>>>=20
>>>> Martin Jansa (1):
>>>>    ltp: set PREFERRED_PROVIDER and rename runtests_noltp.sh script
>>>>=20
>>>=20
>>> I will take this.
>>>=20
>>>> Richard Purdie (1):
>>>>    eglibc-initial.inc: Drop duplicate include
>>>>=20
>>>=20
>>>=20
>>> It seems that this is a trivial fix, I don't think it's a good idea =
to merge
>>> it to dora.
>>=20
>> Thanks to one of the bitbake patches we backported, this "trivial" =
issue
>> is now putting warnings in peoples builds so I think it might be a =
good
>> idea to fix it.
>=20
> Ya I agree.  This is going to cause confusion for people.  Being a =
small 2 line patch, and pretty easy to show that it's "safe".  I'd also =
recommend that that backport be accepted.

I agree as well.

regards,

Koen=

