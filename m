Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32318.1793878702695557281
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 03:38:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=fyHPZHAq;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91c5e31bea9so24141396d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 03:38:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793878701; cv=none;
        d=google.com; s=arc-20260327;
        b=o9ijNLnEH3hfw3zGYrGMReJXG6V8ZeYtvp8XFp+zJvx0dsH+Wae2+WBoo8c+JHE5P/
         YPhw8isj+WV0leQ9Xp5zEbf7rfCBOZfS53AhUtJIumtL3cXi8Fv6i9IXEGA+jDQSU/vo
         rHOIkw1VKbpjer4hexBHEK4LmNbVOJyOimmizMXeGr/hI6Hs+fxWk2ZUd+mhxOQsETUy
         6klrJy0ItgVaF0DUr7jwsJlsqPN6atpGx6xSHaNbPmVFW/5MOYSUJ2kHDupmf+RNB3de
         /LmhmJACInr/OQJvekMhWAnp5fSzdOVrxyISQLrDWMsN/9cjfxQ4VogHDEesVUefot7C
         VMEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=d8o//f4zLjs0fCstR1X92loMAdpV3dIKvQiXzP+C3Ec=;
        fh=hrLIMLnLgn9lA4UjcABRY9PW9LZQM2JxdaLMYkWr4sM=;
        b=ZZBNeLcvTXbwzWkIZkzijmGk5YEuR34rd9wupcJGYqfaeoi3KX0/tLmZxkOjb8MveJ
         GJNaP7ba2w3kmNsNNWNqN61ZpCp/2o9b0D9jjSY0rsBV2z6oBtsvNaGshgmZN9ymf/tM
         bpZwYOlVJLyVlWiXR+/o3cJ86g6JKiMRSrOmdkhA4p4qbv5zS1O3t8QqO2gOX+zVCQRJ
         vNrYzKXumQ1aXRQvoEwf5yjM3YL3x8AQX83y/r9kiC9AGOkVQnGWVEx0kiUvFxKHtnL9
         vDr5DMcvyMERtuIuZvfvQjRUdt53jer0FwByidYaEJ8t/xO1bH8agS4l0GPXi3NdNOx3
         r3Ow==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793878701; x=1794483501; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d8o//f4zLjs0fCstR1X92loMAdpV3dIKvQiXzP+C3Ec=;
        b=fyHPZHAqs/MgzQPh5ZFRFXVMwAOsVKSv+x1WQB3TNeGljnSruPh3PSu+vbTJxpphMg
         /qvqD1BqoyOC8F+ccNV0gO3bIHzXiefYAWsv/NT6LGfh9KmoQ4d5djOxIor5ePeG8DB4
         8BPRFhtYt+DbFyULnSVMGJKc3Dq0pa6jf3VMNW+4h8qS0dQ5fhE3zIdXtFuV7VRrLmZb
         hEvgY2Hz8JwelE9XCieXIcntVMt0dAvWD22036aNzHDgX+R7O1jDbyFuf8jgY4H23L4U
         HyY9NPEDBLLmKCjEpX2ga1UTKn7rPvruVlY6VMI8IVjQ5lWYbcGK6yDDp5SaoaxmEfZ6
         30Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793878701; x=1794483501;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d8o//f4zLjs0fCstR1X92loMAdpV3dIKvQiXzP+C3Ec=;
        b=R+fUqGfxyo8Ng4XdYI+K2eXUDrQNJMj/6ScscbwoI6tOb/d+ZgjjnHj19PC9EY8niW
         vhVUWZLUDLE3c80rgzr0jg0KMqArxRLGijisGTLJ4V2Pxg58uVMJUUizI+jj6tPr6Xaz
         ob4ioObJ2bbLP2KJIK4q4E0eymfZ36YOVCmaOSoWTHT5x6kXAtg+a9+u2FdXJh1/8HDb
         grHrY+Hk71GdE6xac4mzwsRUhwjqWi0MLsBH/fG68AtleF60q2jtFncNWhbmXHEsw6Om
         OdbDd1EOUoBvM8tJTQllp6aY4fGjqn1omMLynGM9J2yomU5ogoPP1krv2sOjNSr6Yy0o
         QKqA==
X-Gm-Message-State: APuU4Z81Q8nzq81iOLOYvueJDb8DslLwVau//5ZQMVSDgODVba9g/cGh
	qis54btv2dIEcK4yekeoqXW1B9+OGWySaKReMlGd8PkjXsmNIlnUjKe/qUzjLSvCyGzCMPnwNaj
	lWCRBByIpHTrAwRNxQbh6oa/ory4GcK4=
X-Gm-Gg: AYBFou1arTc7IK6RtPBHtRk1KsQZ2JYH8GSY5U+Nd5ZilCE6rPhWYOPmSh2OiCSwfqo
	bnz1+eAouaoiPHXHSAP6q/qCYT0TWY86ZocFPDjySuRLN+3/hFS90whqkwKkMTqpkT9nvc/tO25
	C76EipoK3zXOJuVFIbGKsghu0ggceliLOIFiZKjokBdIGHJge1cM6Hd9eMwqKaVSjB7CL+f1UnB
	BTM7OwnfwOu33H2hSRm0TGXgDLVz4yQ0d1Bt2KH8DMFwhlflKmPCCd1Buzts8I4TQOO7iXUqdgF
	7/N86s6JZufJJ4xSfCdB5QpFen4G/OOs1r+NlgZqGxwfOW+d88q6eY2BWwfiX/wGTVR46Os5D8r
	CMTTM5P5qIXIlFSX2JmJZHhLVKtdX36Q3gjBO6NIbol3xpwhIf0gnBNJUgx6xTpuVmOR6kNw=
X-Received: by 2002:a05:6214:76b:b0:91e:887f:8bf1 with SMTP id
 6a1803df08f44-91e887f8ea5mr62019146d6.33.1793878701330; Thu, 05 Nov 2026
 03:38:21 -0800 (PST)
MIME-Version: 1.0
References: <20261029131154.7487-1-pratik.farkase@est.tech> <20261103090715.13551-1-pratik.farkase@est.tech>
In-Reply-To: <20261103090715.13551-1-pratik.farkase@est.tech>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 5 Nov 2026 12:38:09 +0100
X-Gm-Features: AclHuK8CPzzbgqwXX9NP_1DHq-8LMx6K55W139RjRR3-Mno8DpzprimIPUc5oas
Message-ID: <CANNYZj-Ob+5yn2RQ1-na4ud6_S7C7EjdwBBijayXHA=7SDXfAg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] lttng-ust: add ptest support
To: pratik.farkase@est.tech
Cc: openembedded-core@lists.openembedded.org, pratik.farkase@ericsson.com
Content-Type: multipart/alternative; boundary="000000000000c356e2065f85ee55"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 11:38:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249542

--000000000000c356e2065f85ee55
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Nov 2026 at 10:07, Pratik Farkase via openembedded-core
<pratik.farkase=est.tech@lists.openembedded.org> wrote:

> +TESTS="
> +unit/libringbuffer/test_shm
> +unit/gcc-weak-hidden/test_gcc_weak_hidden
> +unit/libcommon/test_get_cpu_mask_from_sysfs
> +unit/libcommon/test_get_max_cpuid_from_mask
> +unit/libcommon/test_get_max_cpuid_from_sysfs
> +unit/libcommon/test_get_possible_cpus_array_len
> +unit/libmsgpack/test_msgpack
> +unit/pthread_name/test_pthread_name
> +unit/snprintf/test_snprintf
> +unit/ust-elf/test_ust_elf
> +unit/ust-error/test_ust_error
> +unit/ust-utils/test_ust_utils
> +"


Hello Pratik,

hardcoding a list of tests creates a maintainability problem. If upstream
adds more tests, they will not be run. If upstream removes tests, this
creates friction in version updates. Can you find ways to avoid it? One
possibility is to ship the makefile, and issue 'make check' (or something
similar) that would run tests from the list embedded in the makefile.
Another option is to create a list on the fly with 'find'.

+LTTNG_UST_PTEST_DIRS = " \
> +    unit/libringbuffer \
> +    unit/gcc-weak-hidden \
> +    unit/libcommon \
> +    unit/libmsgpack \
> +    unit/pthread_name \
> +    unit/snprintf \
> +    unit/ust-elf \
> +    unit/ust-error \
> +    unit/ust-utils \
> +"
>

This has a similar problem. Rather than go over a hardcoded list of
directories, can we just start from the top dir and visit everything? If
too much is installed, then we can look into ways to trim it.


> +    for d in ${LTTNG_UST_PTEST_DIRS}; do
> +        mf=${B}/tests/$d/Makefile
> +        install -d ${D}${PTEST_PATH}/tests/$d
> +        for p in $(makefile-getvar $mf noinst_PROGRAMS); do
> +            ${B}/libtool --mode=install install -m 0755 ${B}/tests/$d/$p
> ${D}${PTEST_PATH}/tests/$d/
> +        done
> +        for s in $(makefile-getvar $mf dist_noinst_SCRIPTS
> dist_check_SCRIPTS); do
> +            install -m 0755 ${S}/tests/$d/$s ${D}${PTEST_PATH}/tests/$d/
> +        done
> +    done
>

Here's perhaps the most important point. You've done a lot of ptest
additions, but for autotools-driven projects this always results in hacky,
difficult to maintain code. What we would really like to see is support for
installable tests in the autotools upstream. Similar to how gnome project
does it. E.g. extend the macros to add test installation targets, and
making a script that would run them from the target. Then we could convert
all the ptests to use that, a far cleaner, maintainable solution. We can
even carry such a patch ourselves if autotools upstream rejects it (they
can be notoriously stubborn in such matters).

Cheers,
Alex

--000000000000c356e2065f85ee55
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, 3 Nov 2026 at 10:07, Pratik Farkase v=
ia openembedded-core &lt;pratik.farkase=3D<a href=3D"mailto:est.tech@lists.=
openembedded.org">est.tech@lists.openembedded.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">+TESTS=3D&quot;<br>
+unit/libringbuffer/test_shm<br>
+unit/gcc-weak-hidden/test_gcc_weak_hidden<br>
+unit/libcommon/test_get_cpu_mask_from_sysfs<br>
+unit/libcommon/test_get_max_cpuid_from_mask<br>
+unit/libcommon/test_get_max_cpuid_from_sysfs<br>
+unit/libcommon/test_get_possible_cpus_array_len<br>
+unit/libmsgpack/test_msgpack<br>
+unit/pthread_name/test_pthread_name<br>
+unit/snprintf/test_snprintf<br>
+unit/ust-elf/test_ust_elf<br>
+unit/ust-error/test_ust_error<br>
+unit/ust-utils/test_ust_utils<br>
+&quot;</blockquote><div><br></div><div>Hello Pratik,</div><div><br></div><=
div>hardcoding a list of tests creates a maintainability problem. If upstre=
am adds more tests, they will not be run. If upstream removes tests, this c=
reates friction in version updates. Can you find ways to avoid it? One poss=
ibility is to ship the makefile, and issue &#39;make check&#39; (or somethi=
ng similar) that would run tests from the list embedded in the makefile. An=
other option is to create a list on the fly with &#39;find&#39;.</div><div>=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">+LTTNG_UST_PTES=
T_DIRS =3D &quot; \<br>
+=C2=A0 =C2=A0 unit/libringbuffer \<br>
+=C2=A0 =C2=A0 unit/gcc-weak-hidden \<br>
+=C2=A0 =C2=A0 unit/libcommon \<br>
+=C2=A0 =C2=A0 unit/libmsgpack \<br>
+=C2=A0 =C2=A0 unit/pthread_name \<br>
+=C2=A0 =C2=A0 unit/snprintf \<br>
+=C2=A0 =C2=A0 unit/ust-elf \<br>
+=C2=A0 =C2=A0 unit/ust-error \<br>
+=C2=A0 =C2=A0 unit/ust-utils \<br>
+&quot;<br>
</blockquote><div><br></div><div>This has a similar problem. Rather than go=
 over a hardcoded list of directories, can we just start from the top dir a=
nd visit everything? If too much is installed, then we can look into ways t=
o trim it.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">+=C2=A0 =C2=A0 for d in ${LTTNG_UST_PTEST_DIRS}; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mf=3D${B}/tests/$d/Makefile<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/tests/$d<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for p in $(makefile-getvar $mf noinst_PROGRAMS=
); do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${B}/libtool --mode=3Dinstall in=
stall -m 0755 ${B}/tests/$d/$p ${D}${PTEST_PATH}/tests/$d/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for s in $(makefile-getvar $mf dist_noinst_SCR=
IPTS dist_check_SCRIPTS); do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${S}/tests/$d/$s=
 ${D}${PTEST_PATH}/tests/$d/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
+=C2=A0 =C2=A0 done<br></blockquote><div><br></div><div>Here&#39;s perhaps =
the most important point. You&#39;ve done a lot of ptest additions, but for=
 autotools-driven projects this always results in hacky, difficult to maint=
ain code. What we would really like to see is support for installable tests=
 in the autotools upstream. Similar to how gnome project does it. E.g. exte=
nd the macros to add test installation targets, and making a script that wo=
uld run them from the target. Then we could convert all the ptests to use t=
hat, a far cleaner, maintainable solution. We can even carry such a patch o=
urselves if autotools upstream rejects it (they can be notoriously stubborn=
 in such matters).</div><div><br></div><div>Cheers,</div><div>Alex=C2=A0</d=
iv></div></div>

--000000000000c356e2065f85ee55--
