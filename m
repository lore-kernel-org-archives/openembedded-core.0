Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QZfZZ-0000m7-CL
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 10:47:37 +0200
Received: by pwi1 with SMTP id 1so1196137pwi.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2011 01:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=AllP0LhR3XlaruSuv6tqyJ9OxF2Wczeo0CzmSQ4ctZk=;
	b=lmt7jrj9lt1oMbZZyDz2syn5Z1rRlHIC1O2DXPQ9L8c7HX+EVfFCxV+DFnohb5L7Zf
	2MFupe8iA3NKExyxqvqfxYyqWfZKTfJaPgyzM7C2YL4241VyxjfHx7Pi79meOMZUznYW
	x4JV+SfzrIg/AXGhl+O/0d9PbG8jVbHmXkshY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=dZALv22Srd0HDzCDwpnDat+1LXF8TLxpIhWlsaiLdVefOwBbuB+xYniLVjrppIoNaH
	7p1UpONNXLqeWcSALwcpkD6QTZCB0qy/SoxA2tK4/TUuntAnXLHXrl8blfRWj+dRHIsn
	6mBHO9dhqWedJ56ptLAnz5t1cGjBcJqnCStls=
Received: by 10.68.22.2 with SMTP id z2mr991254pbe.428.1308818641073; Thu, 23
	Jun 2011 01:44:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.105 with HTTP; Thu, 23 Jun 2011 01:43:30 -0700 (PDT)
In-Reply-To: <BANLkTikAo4ugWoP=zhvvvOZkdT+-PVERew@mail.gmail.com>
References: <cover.1308706423.git.raj.khem@gmail.com>
	<1308758279.20015.79.camel@rex>
	<4E0235DA.8060200@windriver.com> <4E025052.6070300@windriver.com>
	<BANLkTin7j9VwfP_sF69j_U=T-ZkUj12V=A@mail.gmail.com>
	<1308783588.20015.104.camel@rex>
	<BANLkTikvngN7Xv5jSrPzebiJ_2Pf8pRn+Q@mail.gmail.com>
	<20110623054700.GA3065@jama.jama.net>
	<BANLkTikAo4ugWoP=zhvvvOZkdT+-PVERew@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Jun 2011 01:43:30 -0700
Message-ID: <BANLkTi=9BnrkihMZT-b_7ZiJC6oxjDk3pA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] eglibc 2.14 upgrade
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
X-List-Received-Date: Thu, 23 Jun 2011 08:47:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 22, 2011 at 11:07 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Jun 22, 2011 at 10:47 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>> On Wed, Jun 22, 2011 at 04:22:31PM -0700, Khem Raj wrote:
>>> On Wed, Jun 22, 2011 at 3:59 PM, Richard Purdie
>>> <richard.purdie@linuxfoundation.org> wrote:
>>> > On Wed, 2011-06-22 at 15:31 -0700, Khem Raj wrote:
>>> >> On Wed, Jun 22, 2011 at 1:28 PM, Mark Hatle <mark.hatle@windriver.co=
m> wrote:
>>> >> > On 6/22/11 1:35 PM, Mark Hatle wrote:
>>> >> >> Since applying this update, I'm not longer getting an rpc/rpc.h f=
ile, which
>>> >> >> breaks various things like busybox mount.
>>> >> >>
>>> >> >> Is anyone else seeing this behavior?
>>> >> >
>>> >> > Reverting:
>>> >> >
>>> >> > 2a68cf4d315cdd18766de0c75928ff17846a6cd7 and
>>> >> > 190a946e9a4213944e3ee675c4b3e18701698e87
>>> >> >
>>> >> > fixed the problem for me. =C2=A0So there is definitely a problems =
in the upgrade.
>>> >> >
>>> >>
>>> >> onward looking rpc is now maintained with libtirpc starting glibc 2.=
14 rpc is
>>> >> not to be used from bundled code in glibc. If we dont have recipes f=
or libtirpc
>>> >> then I will add that.
>>> >
>>> > There looks to be more than this wrong with this update. A quick
>>> > comparison shows the following changes in the list of files being
>>> > installed from do_install:
>>> >
>>> > -./lib/libmemusage.so
>>> > -./lib/libnss_hesiod-2.13.so
>>> > -./lib/libnss_nisplus-2.13.so
>>> > -./lib/libutil-2.13.so
>>> > -./lib/libresolv-2.13.so
>>> > -./lib/libm-2.13.so
>>> > -./lib/libnsl-2.13.so
>>> > -./lib/libnss_compat-2.13.so
>>> > -./lib/libnss_nis-2.13.so
>>> > -./lib/libnss_dns-2.13.so
>>> > -./lib/libanl-2.13.so
>>> > -./lib/libBrokenLocale-2.13.so
>>> > -./lib/libcrypt-2.13.so
>>> > -./etc/rpc
>>> > -./usr/lib/libnss_compat_pic.a
>>> > -./usr/lib/libnss_dns_pic.a
>>> > -./usr/lib/libnss_nisplus_pic.a
>>> > +./usr/lib/audit/sotruss-lib.so
>>> > -./usr/lib/libutil_pic.map
>>> > -./usr/lib/libBrokenLocale_pic.a
>>> > -./usr/lib/libBrokenLocale.a
>>> > -./usr/lib/libBrokenLocale_pic.map
>>> > -./usr/lib/libm.a
>>> > -./usr/lib/libnss_dns_pic.map
>>> > -./usr/lib/libm_pic.map
>>> > -./usr/lib/libnss_hesiod_pic.map
>>> > -./usr/lib/librpcsvc.a
>>> > -./usr/lib/libutil.a
>>> > -./usr/lib/libnss_compat_pic.map
>>> > -./usr/lib/libcrypt.a
>>> > -./usr/lib/libutil_pic.a
>>> > -./usr/lib/libanl.a
>>> > -./usr/lib/libnsl_pic.a
>>> > -./usr/lib/libresolv.a
>>> > -./usr/lib/libnss_hesiod_pic.a
>>> > -./usr/lib/libm_pic.a
>>> > -./usr/lib/libnsl_pic.map
>>> > -./usr/lib/libnss_nis_pic.map
>>> > -./usr/lib/libanl_pic.a
>>> > -./usr/lib/libcrypt_pic.map
>>> > -./usr/lib/libcrypt_pic.a
>>> > -./usr/lib/libnss_nis_pic.a
>>> > -./usr/lib/libresolv_pic.map
>>> > -./usr/lib/libresolv_pic.a
>>> > -./usr/lib/libanl_pic.map
>>> > -./usr/lib/libnss_nisplus_pic.map
>>> > -./usr/lib/libnsl.a
>>> > -./usr/bin/rpcgen
>>> > -./usr/bin/gencat
>>> > +./usr/bin/sotruss
>>> > -./usr/bin/localedef
>>> > -./usr/bin/locale
>>> > -./usr/sbin/rpcinfo
>>> > -./usr/sbin/nscd
>>> >
>>> > Some of these are rpc related but there are other issues too.
>>> >
>>> > I've reverted the upgrade itself for now until we have something in
>>> > place to address the issues and its actually had some testing...
>>> >
>>>
>>> some of these are due to rpc and others are due to nss being removed
>>> I need to backport the nss db re-implementation then most of it should
>>> be resolved
>>> I guess I will post 2.14 as additional recipes rather than replacement =
for 2.13
>>> that way we will get some soak time.
>>
>> there are issues with 2.14 and standalone libtirtc too :/
>
> Yes I have a fix for that. I will post as soon as I tame busybox

libtirpc is not yet drop in replacement for glibc rpc and it will take
some time for that to happen
we should revert this patch and stay with 2.13 meanwhile


