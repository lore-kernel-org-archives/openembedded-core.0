Return-Path: <lizhijian@cn.fujitsu.com>
Received: from song.cn.fujitsu.com (unknown [222.73.24.84])
	by mail.openembedded.org (Postfix) with ESMTP id 0CC316BBCE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 05:47:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.89,974,1367942400"; 
   d="scan'208";a="8327845"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 28 Aug 2013 13:44:23 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r7S5lRuF017629;
	Wed, 28 Aug 2013 13:47:28 +0800
Received: from [127.0.0.1] ([10.167.226.56])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013082813453184-1014162 ;
	Wed, 28 Aug 2013 13:45:31 +0800 
Message-ID: <521D8EE4.9040605@cn.fujitsu.com>
Date: Wed, 28 Aug 2013 13:47:16 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
Organization: fnst-ulinux
User-Agent: Mozilla/5.0 (Windows NT 5.1;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <1377596639-26980-1-git-send-email-lizhijian@cn.fujitsu.com>
	<521BFA2A.4090508@linux.intel.com>
	<1377600219.5452.60.camel@phil-desktop.brightsign>
In-Reply-To: <1377600219.5452.60.camel@phil-desktop.brightsign>
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/08/28 13:45:31,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/08/28 13:45:32
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] grep-2.5.1a: fix grep for LSB compliance
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
X-List-Received-Date: Wed, 28 Aug 2013 05:47:33 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

at 2013-8-27 18:43, Phil Blundell wrote:
> On Mon, 2013-08-26 at 18:00 -0700, Saul Wold wrote:
>> On 08/27/2013 02:43 AM, Li Zhijian wrote:
>>> add patch from grep-2.5.1-55.el5.src.rpm and
>>> enable configration option of --without-include-regex
>>>
>>> LSB core-tests failed at /tset/LI18NUX2K.L1/utils/grep-tp/T.grep-tp 5,T=
.egrep-tp 5
>>> which is intend to verify this utility can perform pattern matching in =
searches
>>> without regard to case if -i option is specified.
>>>
>>> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
>>>    SRC=5FURI =3D "${GNU=5FMIRROR}/grep/grep-${PV}.tar.bz2 \
>>>               file://uclibc-fix.patch \
>>> @@ -13,8 +13,25 @@ SRC=5FURI =3D "${GNU=5FMIRROR}/grep/grep-${PV}.tar.b=
z2 \
>>>               file://gettext.patch \
>>>               file://fix64-int-to-pointer.patch \
>>>               file://Makevars \
>>> -           file://grep-CVE-2012-5667.patch \
>> Why are you removing this patch?
> He didn't actually remove it, he just moved it further down the list.
> But...
>
>>>               file://fix-for-texinfo-5.1.patch \
>>> +           file://grep-2.5.1-fgrep.patch \
>>> +           file://grep-2.5.1-bracket.patch \
>>> +           file://grep-2.5-i18n.patch \
>>> +           file://grep-2.5.1-oi.patch \
>>> +           file://grep-2.5.1-manpage.patch \
>>> +           file://grep-2.5.1-color.patch \
>>> +           file://grep-2.5.1-icolor.patch \
>>> +           file://grep-skip.patch \
>>> +           file://grep-2.5.1-egf-speedup.patch \
>>> +           file://grep-2.5.1-dfa-optional.patch \
>>> +           file://grep-2.5.1-tests.patch \
>>> +           file://grep-2.5.1-w.patch \
>>> +           file://grep-P.patch \
>>> +           file://grep-CVE-2012-5667.patch \
>>> +           file://grep-empty-pattern.patch \
>>> +           file://grep-bz460641.patch \
>>> +           file://grep-bz434934.patch \
>>> +           file://grep-man-label.patch \
> ... it's fairly hard to believe that all these patches are really
> necessary to fix the problem with "grep -i" that's described in the
> checkin message.  It looks as though a more accurate description of this
> change would be something like "grep-2.5.1a: import all patches from
> RHEL".
Agree, you are right.
It is easier for me to import all patches from RHEL rather than analysising=
 which
are problem fixed patches.


>
> Also, although adding --without-included-regex probably is a good thing
> (and probably ought to be done for grep-2.14 as well) it's not very
> obvious that this has anything to do with the LSB fix either.

This option --without-included-regex at grep-2.5.1a is also necessary to fi=
x LSB core-test
Otherwise /tset/LI18NUX2K.L1/utils/grep-tp/T.grep-tp 5,T.egrep-tp 5 would F=
AIL=E3=80=82

Thanks
Li

>
> p.
>
>
>
>


--=20
Best regards.
Li Zhijian (8555)


=

