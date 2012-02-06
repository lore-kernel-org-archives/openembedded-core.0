Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RuKny-0003Yd-Dd
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 10:24:10 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q169G7t1029567
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Feb 2012 01:16:08 -0800 (PST)
Received: from [128.224.162.223] (128.224.162.223) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 6 Feb 2012 01:16:07 -0800
Message-ID: <4F2F9A58.3030300@windriver.com>
Date: Mon, 6 Feb 2012 17:16:08 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110921 Thunderbird/3.1.15
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1328509284.git.xiaofeng.yan@windriver.com>	<20120206070513.GC3872@jama.jama.net>
	<4F2F8344.5000509@windriver.com>
In-Reply-To: <4F2F8344.5000509@windriver.com>
X-Originating-IP: [128.224.162.223]
Subject: Re: [PATCH 0/2] glib-2.0: Don't check function "qsort_r" in configure.ac
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
X-List-Received-Date: Mon, 06 Feb 2012 09:24:10 -0000
Content-Type: multipart/alternative;
	boundary="------------000105040209030609000502"

--------------000105040209030609000502
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id q169G7t1029567

On 2012=E5=B9=B402=E6=9C=8806=E6=97=A5 15:37, Xiaofeng Yan wrote:
> On 2012=E5=B9=B402=E6=9C=8806=E6=97=A5 15:05, Martin Jansa wrote:
>> On Mon, Feb 06, 2012 at 02:41:09PM +0800, Xiaofeng Yan wrote:
>>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>>
>>> The function "g_qsort_with_data" has two kinds of realization. One=20
>>> calls qsort_r
>>> from libglib, the other realize itself. the realization method is=20
>>> controlled by macro "HAVE_QSORT_R".
>>> qsort_r from libglib cause sort error. Add no-check-qsort_r.patch=20
>>> for fixing this problem.
>>> This patch is to fix bug 1959. After this patch is merged into=20
>>> OE-core I will open a new bug to
>>> track the reason why qsort_r report normally. For finishing lsb test=20
>>> in YOCTO 1.2 M3 this patch
>>> is applied temporarily.
>>>
>>> Pull URL: git://git.pokylinux.org/poky-contrib.git
>>>    Branch: xiaofeng/1959
>>>    Browse:=20
>>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dxiaofeng/1959
>>>
>>> Thanks,
>>>      Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>> ---
>> no-check-qsort_r.patch is the same as remove.test.for.qsort_r.patch fr=
om
>> http://git.openembedded.org/openembedded-core/commit/?id=3D74f43e3b269=
c01dba7cd5215a8e825229bd5ecff=20
>>
>>
>> which was later removed from glib-2.0-native in
>> http://git.openembedded.org/openembedded-core/commit/?id=3D37579d7d74d=
127c90c1e078d05c5bf4ba0b3f755=20
>>
>>
>> and later removed completely in
>> http://git.openembedded.org/openembedded-core/commit/?id=3D812342e44e9=
e361a0fa93cfcfe65cf4dd6f2fb57=20
>>
>>
>> Are you sure this patch is right fix? And no need to split adding patc=
h
>> itself and adding it to SRC_URI to 2 patches.
>>
>> Cheers,
>>
> Hi Martin Jansa,
> I reviewed the above link, no-check-qsort_r.patch is  the same as=20
> remove.test.for.qsort_r.patch really. Please check attachment for the=20
> test program from LSB 4.1. I think we need this patch because it is an=20
> error really. LSB report the next information:
>
> After sorting array, the 0-th element of array should be 1, but is 2
> After sorting array, the 1-th element of array should be 2, but is 1
> After sorting array, the 2-th element of array should be 3, but is 5
> After sorting array, the 4-th element of array should be 5, but is 3
>
>
> I can reuse this patch which was removed before if you think this is a=20
> bug. Do you any suggestion?
>
> Compile this test program.
> $ gcc -g `pkg-config --cflags glib-2.0` gobject_value_arrays.c -o=20
> gobject -lgobject-2.0
>
>
I reviewed the origin patch from Martin Jansa and found that my patch is=20
different from him.  My patch is to remove the check of qsort_r and the=20
origin had still this check. I also update my patch because
it have two file:// in SRC_URI.
Thank Martin Jansa.

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--------------000105040209030609000502
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id q169G7t1029567

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta content=3D"text/html; charset=3DUTF-8" http-equiv=3D"Content-Ty=
pe">
  </head>
  <body text=3D"#000000" bgcolor=3D"#ffffff">
    On 2012=E5=B9=B402=E6=9C=8806=E6=97=A5 15:37, Xiaofeng Yan wrote:
    <blockquote cite=3D"mid:4F2F8344.5000509@windriver.com" type=3D"cite"=
>On
      2012=E5=B9=B402=E6=9C=8806=E6=97=A5 15:05, Martin Jansa wrote:
      <br>
      <blockquote type=3D"cite">On Mon, Feb 06, 2012 at 02:41:09PM +0800,
        Xiaofeng Yan wrote:
        <br>
        <blockquote type=3D"cite">From: Xiaofeng
          Yan<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:xiaofeng.y=
an@windriver.com">&lt;xiaofeng.yan@windriver.com&gt;</a>
          <br>
          <br>
          The function "g_qsort_with_data" has two kinds of realization.
          One calls qsort_r
          <br>
          from libglib, the other realize itself. the realization method
          is controlled by macro "HAVE_QSORT_R".
          <br>
          qsort_r from libglib cause sort error. Add
          no-check-qsort_r.patch for fixing this problem.
          <br>
          This patch is to fix bug 1959. After this patch is merged into
          OE-core I will open a new bug to
          <br>
          track the reason why qsort_r report normally. For finishing
          lsb test in YOCTO 1.2 M3 this patch
          <br>
          is applied temporarily.
          <br>
          <br>
          Pull URL: git://git.pokylinux.org/poky-contrib.git
          <br>
          =C2=A0=C2=A0 Branch: xiaofeng/1959
          <br>
          =C2=A0=C2=A0 Browse:
          <a class=3D"moz-txt-link-freetext" href=3D"http://git.pokylinux=
.org/cgit.cgi/poky-contrib/log/?h=3Dxiaofeng/1959">http://git.pokylinux.o=
rg/cgit.cgi/poky-contrib/log/?h=3Dxiaofeng/1959</a>
          <br>
          <br>
          Thanks,
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0 Xiaofeng Yan<a class=3D"moz-txt-link-r=
fc2396E" href=3D"mailto:xiaofeng.yan@windriver.com">&lt;xiaofeng.yan@wind=
river.com&gt;</a>
          <br>
          ---
          <br>
        </blockquote>
        no-check-qsort_r.patch is the same as
        remove.test.for.qsort_r.patch from
        <br>
<a class=3D"moz-txt-link-freetext" href=3D"http://git.openembedded.org/op=
enembedded-core/commit/?id=3D74f43e3b269c01dba7cd5215a8e825229bd5ecff">ht=
tp://git.openembedded.org/openembedded-core/commit/?id=3D74f43e3b269c01db=
a7cd5215a8e825229bd5ecff</a>
        <br>
        <br>
        which was later removed from glib-2.0-native in
        <br>
<a class=3D"moz-txt-link-freetext" href=3D"http://git.openembedded.org/op=
enembedded-core/commit/?id=3D37579d7d74d127c90c1e078d05c5bf4ba0b3f755">ht=
tp://git.openembedded.org/openembedded-core/commit/?id=3D37579d7d74d127c9=
0c1e078d05c5bf4ba0b3f755</a>
        <br>
        <br>
        and later removed completely in
        <br>
<a class=3D"moz-txt-link-freetext" href=3D"http://git.openembedded.org/op=
enembedded-core/commit/?id=3D812342e44e9e361a0fa93cfcfe65cf4dd6f2fb57">ht=
tp://git.openembedded.org/openembedded-core/commit/?id=3D812342e44e9e361a=
0fa93cfcfe65cf4dd6f2fb57</a>
        <br>
        <br>
        Are you sure this patch is right fix? And no need to split
        adding patch
        <br>
        itself and adding it to SRC_URI to 2 patches.
        <br>
        <br>
        Cheers,
        <br>
        <br>
      </blockquote>
      Hi Martin Jansa,
      <br>
      I reviewed the above link, no-check-qsort_r.patch is=C2=A0 the same=
 as
      remove.test.for.qsort_r.patch really. Please check attachment for
      the test program from LSB 4.1. I think we need this patch because
      it is an error really. LSB report the next information:
      <br>
      <br>
      After sorting array, the 0-th element of array should be 1, but is
      2
      <br>
      After sorting array, the 1-th element of array should be 2, but is
      1
      <br>
      After sorting array, the 2-th element of array should be 3, but is
      5
      <br>
      After sorting array, the 4-th element of array should be 5, but is
      3
      <br>
      <br>
      <br>
      I can reuse this patch which was removed before if you think this
      is a bug. Do you any suggestion?
      <br>
      <br>
      Compile this test program.
      <br>
      $ gcc -g `pkg-config --cflags glib-2.0` gobject_value_arrays.c -o
      gobject -lgobject-2.0
      <br>
      <br>
      <br>
    </blockquote>
    I reviewed the origin patch from Martin Jansa and found that my
    patch is different from him.=C2=A0 My patch is to remove the check of
    qsort_r and the origin had still this check. I also update my patch
    because <br>
    it have two <a class=3D"moz-txt-link-freetext" href=3D"file://">file:=
//</a> in SRC_URI.<br>
    Thank Martin Jansa.<br>
    <br>
    <blockquote cite=3D"mid:4F2F8344.5000509@windriver.com" type=3D"cite"=
>
      <pre wrap=3D"">
<fieldset class=3D"mimeAttachmentHeader"></fieldset>
_______________________________________________
Openembedded-core mailing list
<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:Openembedded-core@li=
sts.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class=3D"moz-txt-link-freetext" href=3D"http://lists.linuxtogo.org/cgi=
-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-b=
in/mailman/listinfo/openembedded-core</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------000105040209030609000502--
