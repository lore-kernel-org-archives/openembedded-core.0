Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 368AA731D3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 14:33:12 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id 1so240686063ion.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 06:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=MTtWW33hiQ0bUHGw5fEMiRbN0V7L9UcDSb3cMQyy8LM=;
	b=sj5KqFkh3aKkADb8Q2fU1VADrkunCNeeeDPWtukFbP7lV/2oHccYTJHcq9iOULltvd
	Y9i5GZZwBMpWOGzdVOlz2FRaBvXyT46MWhSFVMSQ7AveGvoi9MR4+VMEaHKEAFhm1JcF
	m8etUxd7FmiytMoflAO/hVm9r7sif2O+SYPx4g5suc3H3i/XMFCDHoAHjP480SHy9ia7
	eyORcz6mvlPQW0XZwlxXnMfRdvIso8ZhbsWhBoFasQfqlmpAfRgQJ5jXj1zxtUlEcQmf
	bpG/SLYHdx3HdtE61fse04fRqoIoPIsHQFCIT7B4AfFaDGVCG0fhfQqjvFccoI5RM948
	Lt/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=MTtWW33hiQ0bUHGw5fEMiRbN0V7L9UcDSb3cMQyy8LM=;
	b=Fv7Wp6U7HG4oojkriIuuUR/FC2wQIsd6BoUakqhsNsvfMhUuTDsTny9EKA+XJKyHdw
	V+sujXPA8wVkWmlyZTY5KKyqYniPWzQtzaETeapPoSTF/890k7w6vN4zhuhj0/piTHtJ
	LcvRmPz2i6eaGX0RWXw50AM/1y5CNW8DiNGB61QKmZRLMF17mC+byBJ0VFWg1UzUxu2M
	JkeRi6urZhCCYBVGjXHYQl3gqV1evV9QmSiG53nvzL01jT0ZbNbFLKuzJzuAp1TvWajg
	aqP1Fc3gkIcAjzFYinuUXH1ZqKeHq3OTkT53AKTzHbEC9eAwznr+J6Z57bDgR/SYDfN5
	08Iw==
X-Gm-Message-State: ALoCoQlx1bQkQnidHprdrktT5zwURKqkM67NBc5Qr5vXztrqKMVX7kV/H6+P+dWXZaDzEYFL7jCXMcx20vVfOYU0NLV4MUrX6n6+Vo0dD6riZ+Ku1s7ygdE=
X-Received: by 10.107.3.154 with SMTP id e26mr95443810ioi.99.1452263593417;
	Fri, 08 Jan 2016 06:33:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 8 Jan 2016 06:32:54 -0800 (PST)
In-Reply-To: <CAJTo0La=m_u33L7z06GssdbQoQ0bAFpTweaUchU_kVDfOgnNwQ@mail.gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
	<CAJTo0La=m_u33L7z06GssdbQoQ0bAFpTweaUchU_kVDfOgnNwQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Jan 2016 14:32:54 +0000
Message-ID: <CAJTo0La3v=55Kf=kd2N34g836tAzeieffFOX7c81=yudby=VWw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/53] musl fixes 3
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
X-List-Received-Date: Fri, 08 Jan 2016 14:33:14 -0000
Content-Type: multipart/alternative; boundary=001a113ec10a9b4d520528d3779a

--001a113ec10a9b4d520528d3779a
Content-Type: text/plain; charset=UTF-8

On 8 January 2016 at 14:00, Burton, Ross <ross.burton@intel.com> wrote:

> systemd fails with this error, over and over:
>
> |
> /data/poky-master/tmp/work/i586-poky-linux-musl/systemd/1_228+gitAUTOINC+dd050decb6-r0/git/src/basic/util.h:96:70:
> error: unknown type name 'comparison_fn_t'
> |  static inline void qsort_safe(void *base, size_t nmemb, size_t size,
> comparison_fn_t compar) {
>

I've just remembered about meta-musl so this is likely fixed there but I'm
also seeing this when building systemd:

|
/data/poky-master/tmp/work/i586-poky-linux-musl/systemd/1_228+gitAUTOINC+dd050decb6-r0/git/src/basic/missing.h:590:6:
error: #error "neither secure_getenv nor __secure_getenv are available"

Now I'll disable systemd verify it all works with sysvinit.

Ross

--001a113ec10a9b4d520528d3779a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 January 2016 at 14:00, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border=
-left-style:solid;padding-left:1ex"><div class=3D"gmail_extra">systemd fail=
s with this error, over and over:</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra"><div class=3D"gmail_extra">| /data/poky-master/=
tmp/work/i586-poky-linux-musl/systemd/1_228+gitAUTOINC+dd050decb6-r0/git/sr=
c/basic/util.h:96:70: error: unknown type name &#39;comparison_fn_t&#39;</d=
iv><div class=3D"gmail_extra">| =C2=A0static inline void qsort_safe(void *b=
ase, size_t nmemb, size_t size, comparison_fn_t compar) {</div></div></bloc=
kquote></div><br>I&#39;ve just remembered about meta-musl so this is likely=
 fixed there but I&#39;m also seeing this when building systemd:</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">| /data/poky-mas=
ter/tmp/work/i586-poky-linux-musl/systemd/1_228+gitAUTOINC+dd050decb6-r0/gi=
t/src/basic/missing.h:590:6: error: #error &quot;neither secure_getenv nor =
__secure_getenv are available&quot;<br></div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">Now I&#39;ll disable systemd verify it al=
l works with sysvinit.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a113ec10a9b4d520528d3779a--
