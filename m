Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web11.11367.1602072612221719877
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 05:10:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CLM7gTOi;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id u8so2619917ejg.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2020 05:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wWDv25ywOO6vi+Kg4gVfCvaO2qTDmuDWzmTL86mcI/o=;
        b=CLM7gTOiVKD1fbrHLuidDhvfGl5JO6ZXYm2Xr0e+04B+AUbeH0wqv77IDEvrZyy/mE
         sxYpVagv73FdeVM7GECJiRZAhSngsvlohMRTO5CCWbljVClq0HxKkyvb7GAGui95G0tF
         QhuEx4QlMcpawABf4M26kEvmI+62v6G6Pfuf9/GYpfx1qJw6DWujnaUI7gUa2Nx83yIF
         eNeoNDQUmCSbp0ZYYFrgR+zDYJjuGRNW8m1Flm6w3pY83bIAiXWS30JVSmUIFp0jdlK4
         Lk0kBZq7sXWrhOobzzNEDHee7r5+ZyTZT7B0orTxx9ZlxoM3SpqDMneB4OAiGa2eAM5a
         QGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wWDv25ywOO6vi+Kg4gVfCvaO2qTDmuDWzmTL86mcI/o=;
        b=gZSQ3ZvoCxF5tYYCl8FEDEkgbzT8xHyT9oustDeFq2VDuHX8SS/L8sfpJbLOziv0GZ
         QruRXM5BPUsoJ46H994NOl59JBJqEJK0jCirl3A/qBI413qWB0PaY64fmR6ocXqH9PYv
         UxjuNdDqmWMH+Bi0O6+gGo7/OFUQFcb43N2dx1ls1heNu3gIvBKFFa7Q2zF3WGdhx8p/
         AgFh8zdJhr6EoDT4D1/J0C+f53kciLMN6dHL7bfcxm4cUb3HU6w1xtQvlWJaYu/tLOCi
         X9PH7PCvYodRYpsaiLAT9mLqyAwZn/RZLZQ3PbOBe+2w6+ad2TCK/oKzvRx0l54YENTz
         E6KQ==
X-Gm-Message-State: AOAM532F2RHYkgvbuRXdcYgJ46lwpL2bsstc+9ja/BC6sFd45bO2nQ5A
	HJbVzLAtC1fCS4XJ4d7sJAxeVoxlLI5cOS99MobShQ+xL1c=
X-Google-Smtp-Source: ABdhPJzZYiBPOUTXBHb6ZtvccbDND03sddoc4k5fiIEEniz0fGEshkorE88HvzZQdk0t/ccOq6T4i8BRwzgFXETHF8Y=
X-Received: by 2002:a17:906:4a97:: with SMTP id x23mr2916786eju.471.1602072610389;
 Wed, 07 Oct 2020 05:10:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200729133256.20229-1-viktor.rosendahl@bmw.de>
In-Reply-To: <20200729133256.20229-1-viktor.rosendahl@bmw.de>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 7 Oct 2020 14:09:59 +0200
Message-ID: <CA+chaQfJONtwMRxOzStaK+78qCP4vcksoTJD4NxNzEQNWAwa1A@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] boost: backport fix to make async_pipes work with asio
To: Viktor Rosendahl <viktor.rosendahl@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	Steve Sakoman <steve@sakoman.com>, Viktor Rosendahl <Viktor.Rosendahl@bmw.de>
Content-Type: multipart/alternative; boundary="000000000000d8c4a305b1139850"

--000000000000d8c4a305b1139850
Content-Type: text/plain; charset="UTF-8"

It's not caused by this change, but when rebuilding dunfell based build
with this change included I've noticed:
WARNING: boost-1.72.0-r0 do_fetch: Checksum mismatch for local file
downloads/boost_1_72_0.tar.bz2
Cleaning and trying again.
WARNING: boost-1.72.0-r0 do_fetch: Renaming downloads/boost_1_72_0.tar.bz2
to
downloads/boost_1_72_0.tar.bz2_bad-checksum_9df25550eb5a8d5a83dc67be4135d3785ab02b22c6972e5e3da1d79781b03f0b

and the tarballs are indeed quite different:

boost-new/boost_1_72_0:
INSTALL  Jamroot  LICENSE_1_0.txt  README.md  boost  boost-build.jam
 boost.css  boost.png  boostcpp.jam  bootstrap.bat  bootstrap.sh  doc
 index.htm  index.html  libs  more  rst.css  status  tools

boost-old/boost_1_72_0:
INSTALL  LICENSE_1_0.txt  boost  boost.css  boost.png  boostcpp.jam
 bootstrap.bat  bootstrap.sh  doc  index.htm  libs  status

$ diff -rq boost-*
Only in boost-new/boost_1_72_0: Jamroot
Only in boost-new/boost_1_72_0: README.md
Only in boost-new/boost_1_72_0/boost: archive
Only in boost-new/boost_1_72_0/boost: array.hpp
Only in boost-new/boost_1_72_0/boost: assign
Only in boost-new/boost_1_72_0/boost: atomic
Only in boost-new/boost_1_72_0/boost: beast.hpp
Only in boost-new/boost_1_72_0/boost: blank.hpp
Only in boost-new/boost_1_72_0/boost: callable_traits
Only in boost-new/boost_1_72_0/boost: checked_delete.hpp
Only in boost-new/boost_1_72_0/boost: circular_buffer
Only in boost-new/boost_1_72_0/boost: compatibility
Only in boost-new/boost_1_72_0/boost: compute
Only in boost-new/boost_1_72_0/boost: concept
Only in boost-new/boost_1_72_0/boost: concept_check.hpp
Only in boost-new/boost_1_72_0/boost: container
Only in boost-new/boost_1_72_0/boost: convert.hpp
Only in boost-new/boost_1_72_0/boost: current_function.hpp
Only in boost-new/boost_1_72_0/boost: date_time
Only in boost-new/boost_1_72_0/boost: date_time.hpp
Only in boost-new/boost_1_72_0/boost: dynamic_bitset
Only in boost-new/boost_1_72_0/boost: dynamic_bitset.hpp
Only in boost-new/boost_1_72_0/boost: foreach_fwd.hpp
Only in boost-new/boost_1_72_0/boost: format
Only in boost-new/boost_1_72_0/boost: format.hpp
Only in boost-new/boost_1_72_0/boost: function
Only in boost-new/boost_1_72_0/boost: functional
Only in boost-new/boost_1_72_0/boost: generator_iterator.hpp
Only in boost-new/boost_1_72_0/boost/geometry/srs: esri.hpp
Files
boost-new/boost_1_72_0/boost/geometry/srs/projections/iau2000_traits.hpp
and
boost-old/boost_1_72_0/boost/geometry/srs/projections/iau2000_traits.hpp
differ
Only in boost-new/boost_1_72_0/boost/geometry/srs/projections: spar.hpp
Only in boost-new/boost_1_72_0/boost/geometry/srs: shared_grids.hpp
Only in boost-new/boost_1_72_0/boost/geometry/srs: sphere.hpp
Only in boost-new/boost_1_72_0/boost/geometry/srs: spheroid.hpp
Only in boost-new/boost_1_72_0/boost: get_pointer.hpp
Only in boost-new/boost_1_72_0/boost: gil
Only in boost-new/boost_1_72_0/boost: hana
Only in boost-new/boost_1_72_0/boost: hana.hpp
Only in boost-new/boost_1_72_0/boost: heap
Only in boost-new/boost_1_72_0/boost: histogram
Only in boost-new/boost_1_72_0/boost: integer
Only in boost-new/boost_1_72_0/boost: iostreams
Only in boost-new/boost_1_72_0/boost: is_placeholder.hpp
Only in boost-new/boost_1_72_0/boost: lambda
Only in boost-new/boost_1_72_0/boost: locale
Only in boost-new/boost_1_72_0/boost: logic
Only in boost-new/boost_1_72_0/boost: make_shared.hpp
Only in boost-new/boost_1_72_0/boost: math
Only in boost-new/boost_1_72_0/boost: memory_order.hpp
Only in boost-new/boost_1_72_0/boost: mp11.hpp
Only in boost-new/boost_1_72_0/boost: mpi
Only in boost-new/boost_1_72_0/boost: multiprecision
Only in boost-new/boost_1_72_0/boost: non_type.hpp
Only in boost-new/boost_1_72_0/boost: operators_v1.hpp
Only in boost-new/boost_1_72_0/boost: outcome
Only in boost-new/boost_1_72_0/boost: outcome.hpp
Only in boost-new/boost_1_72_0/boost: pending
Only in boost-new/boost_1_72_0/boost: phoenix
Only in boost-new/boost_1_72_0/boost: pointee.hpp
Only in boost-new/boost_1_72_0/boost: pointer_cast.hpp
Only in boost-new/boost_1_72_0/boost: predef.h
Only in boost-new/boost_1_72_0/boost: process
Only in boost-new/boost_1_72_0/boost: proto
Only in boost-new/boost_1_72_0/boost: python
Only in boost-new/boost_1_72_0/boost: random.hpp
Only in boost-new/boost_1_72_0/boost: regex.hpp
Only in boost-new/boost_1_72_0/boost: scope_exit.hpp
Only in boost-new/boost_1_72_0/boost: scoped_array.hpp
Only in boost-new/boost_1_72_0/boost: serialization
Only in boost-new/boost_1_72_0/boost: shared_container_iterator.hpp
Only in boost-new/boost_1_72_0/boost: spirit
Only in boost-new/boost_1_72_0/boost: stacktrace
Only in boost-new/boost_1_72_0/boost: statechart
Only in boost-new/boost_1_72_0/boost: token_functions.hpp
Only in boost-new/boost_1_72_0/boost: type_traits.hpp
Only in boost-new/boost_1_72_0/boost: unordered_map.hpp
Only in boost-new/boost_1_72_0/boost: utility
Only in boost-new/boost_1_72_0/boost: variant2
Only in boost-new/boost_1_72_0/boost: weak_ptr.hpp
Only in boost-new/boost_1_72_0: boost-build.jam
Only in boost-new/boost_1_72_0: index.html
Only in boost-new/boost_1_72_0: more
Only in boost-new/boost_1_72_0: rst.css
Only in boost-new/boost_1_72_0: tools

I don't remember any commit updating the checksum from:
9df25550eb5a8d5a83dc67be4135d3785ab02b22c6972e5e3da1d79781b03f0b
downloads/boost_1_72_0.tar.bz2_bad-checksum_9df25550eb5a8d5a83dc67be4135d3785ab02b22c6972e5e3da1d79781b03f0b
to
59c9b274bc451cf91a9ba1dd2c7fdcaf5d60b1b3aa83f2c9fa143417cc660722
downloads/boost_1_72_0.tar.bz2
currently used in recipe.

It's possible that there is another recipe somewhere using the
same boost_1_72_0.tar.bz2 archive from different URL with different
checksums.

Regards,

On Wed, Jul 29, 2020 at 3:33 PM Viktor Rosendahl <viktor.rosendahl@gmail.com>
wrote:

> From: Viktor Rosendahl <Viktor.Rosendahl@bmw.de>
>
> async_pipe is missing the executor_type type, which is expected by
> asio in /usr/include/boost/asio/impl/read.hpp. Without this, it's
> not possible to even compile code that uses constructs such as:
>
> boost::asio::io_service foo;
> boost::process::async_pipe foopipe{ boost::process::async_pipe(foo) };
>
> This is only relevant for Dunfell because master has already moved to
> boost-1.73.0 in which this bug has been fixed. The bug is also not
> present in Zeus, which uses boost-1.71.0.
>
> Signed-off-by: Viktor Rosendahl <Viktor.Rosendahl@bmw.de>
> ---
>  .../0001-added-typedef-executor_type.patch    | 53 +++++++++++++++++++
>  meta/recipes-support/boost/boost_1.72.0.bb    |  1 +
>  2 files changed, 54 insertions(+)
>  create mode 100644
> meta/recipes-support/boost/boost/0001-added-typedef-executor_type.patch
>
> diff --git
> a/meta/recipes-support/boost/boost/0001-added-typedef-executor_type.patch
> b/meta/recipes-support/boost/boost/0001-added-typedef-executor_type.patch
> new file mode 100644
> index 0000000000..83d3749e15
> --- /dev/null
> +++
> b/meta/recipes-support/boost/boost/0001-added-typedef-executor_type.patch
> @@ -0,0 +1,53 @@
> +From 6a4d2ff72114ef47c7afaf92e1042aca3dfa41b0 Mon Sep 17 00:00:00 2001
> +From: Klemens David Morgenstern <klemens.morgenstern@gmx.net>
> +Date: Fri, 22 Nov 2019 14:03:22 +0800
> +Subject: [PATCH] added typedef executor_type;
> +
> +Upstream-Status: Backport [
> https://github.com/boostorg/process/commit/6a4d2ff72114ef47c7afaf92e1042aca3dfa41b0
> ]
> +
> +---
> + include/boost/process/async_pipe.hpp                | 2 ++
> + include/boost/process/detail/posix/async_pipe.hpp   | 1 +
> + include/boost/process/detail/windows/async_pipe.hpp | 1 +
> + 3 files changed, 4 insertions(+)
> +
> +diff --git a/include/boost/process/async_pipe.hpp
> b/include/boost/process/async_pipe.hpp
> +index 101fe1d..a562432 100644
> +--- a/boost/process/async_pipe.hpp
> ++++ b/boost/process/async_pipe.hpp
> +@@ -47,6 +47,8 @@ public:
> +      */
> +     typedef platform_specific handle_type;
> +
> ++    typedef typename handle_type::executor_type executor_type;
> ++
> +     /** Construct a new async_pipe, does automatically open the pipe.
> +      * Initializes source and sink with the same io_context.
> +      * @note Windows creates a named pipe here, where the name is
> automatically generated.
> +diff --git a/include/boost/process/detail/posix/async_pipe.hpp
> b/include/boost/process/detail/posix/async_pipe.hpp
> +index 725a078..a82c057 100644
> +--- a/boost/process/detail/posix/async_pipe.hpp
> ++++ b/boost/process/detail/posix/async_pipe.hpp
> +@@ -23,6 +23,7 @@ class async_pipe
> + public:
> +     typedef int native_handle_type;
> +     typedef ::boost::asio::posix::stream_descriptor handle_type;
> ++    typedef typename handle_type::executor_type executor_type;
> +
> +     inline async_pipe(boost::asio::io_context & ios) : async_pipe(ios,
> ios) {}
> +
> +diff --git a/include/boost/process/detail/windows/async_pipe.hpp
> b/include/boost/process/detail/windows/async_pipe.hpp
> +index 06d5f2d..0b447f9 100644
> +--- a/boost/process/detail/windows/async_pipe.hpp
> ++++ b/boost/process/detail/windows/async_pipe.hpp
> +@@ -48,6 +48,7 @@ class async_pipe
> + public:
> +     typedef ::boost::winapi::HANDLE_ native_handle_type;
> +     typedef ::boost::asio::windows::stream_handle   handle_type;
> ++    typedef typename handle_type::executor_type executor_type;
> +
> +     async_pipe(boost::asio::io_context & ios) : async_pipe(ios, ios,
> make_pipe_name(), true) {}
> +     async_pipe(boost::asio::io_context & ios_source,
> boost::asio::io_context & ios_sink)
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-support/boost/boost_1.72.0.bb
> b/meta/recipes-support/boost/boost_1.72.0.bb
> index 0b7badbc76..51c84bc935 100644
> --- a/meta/recipes-support/boost/boost_1.72.0.bb
> +++ b/meta/recipes-support/boost/boost_1.72.0.bb
> @@ -8,4 +8,5 @@ SRC_URI += "file://arm-intrinsics.patch \
>
> file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
>             file://0001-dont-setup-compiler-flags-m32-m64.patch \
>             file://0001-revert-cease-dependence-on-range.patch \
> +           file://0001-added-typedef-executor_type.patch \
>             "
> --
> 2.17.1
>
> 
>

--000000000000d8c4a305b1139850
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It&#39;s not caused by this change, but when rebuilding du=
nfell based build with this change included I&#39;ve noticed:<div>WARNING: =
boost-1.72.0-r0 do_fetch: Checksum mismatch for local file downloads/boost_=
1_72_0.tar.bz2<br>Cleaning and trying again.<br>WARNING: boost-1.72.0-r0 do=
_fetch: Renaming downloads/boost_1_72_0.tar.bz2 to downloads/boost_1_72_0.t=
ar.bz2_bad-checksum_9df25550eb5a8d5a83dc67be4135d3785ab02b22c6972e5e3da1d79=
781b03f0b<br></div><div><br></div><div>and the tarballs are indeed quite di=
fferent:</div><div><br></div><div>boost-new/boost_1_72_0:<br>INSTALL =C2=A0=
Jamroot =C2=A0LICENSE_1_0.txt =C2=A0README.md =C2=A0boost =C2=A0boost-build=
.jam =C2=A0boost.css =C2=A0boost.png =C2=A0boostcpp.jam =C2=A0bootstrap.bat=
 =C2=A0bootstrap.sh =C2=A0doc =C2=A0index.htm =C2=A0index.html =C2=A0libs =
=C2=A0more =C2=A0rst.css =C2=A0status =C2=A0tools<br><br>boost-old/boost_1=
_72_0:<br>INSTALL =C2=A0LICENSE_1_0.txt =C2=A0boost =C2=A0boost.css =C2=A0b=
oost.png =C2=A0boostcpp.jam =C2=A0bootstrap.bat =C2=A0bootstrap.sh =C2=A0do=
c =C2=A0index.htm =C2=A0libs =C2=A0status<br></div><div><br></div><div>$ di=
ff -rq boost-*<br>Only in boost-new/boost_1_72_0: Jamroot<br>Only in boost-=
new/boost_1_72_0: README.md<br>Only in boost-new/boost_1_72_0/boost: archiv=
e<br>Only in boost-new/boost_1_72_0/boost: array.hpp<br>Only in boost-new/b=
oost_1_72_0/boost: assign<br>Only in boost-new/boost_1_72_0/boost: atomic<b=
r>Only in boost-new/boost_1_72_0/boost: beast.hpp<br>Only in boost-new/boos=
t_1_72_0/boost: blank.hpp<br>Only in boost-new/boost_1_72_0/boost: callable=
_traits<br>Only in boost-new/boost_1_72_0/boost: checked_delete.hpp<br>Only=
 in boost-new/boost_1_72_0/boost: circular_buffer<br>Only in boost-new/boos=
t_1_72_0/boost: compatibility<br>Only in boost-new/boost_1_72_0/boost: comp=
ute<br>Only in boost-new/boost_1_72_0/boost: concept<br>Only in boost-new/b=
oost_1_72_0/boost: concept_check.hpp<br>Only in boost-new/boost_1_72_0/boos=
t: container<br>Only in boost-new/boost_1_72_0/boost: convert.hpp<br>Only i=
n boost-new/boost_1_72_0/boost: current_function.hpp<br>Only in boost-new/b=
oost_1_72_0/boost: date_time<br>Only in boost-new/boost_1_72_0/boost: date_=
time.hpp<br>Only in boost-new/boost_1_72_0/boost: dynamic_bitset<br>Only in=
 boost-new/boost_1_72_0/boost: dynamic_bitset.hpp<br>Only in boost-new/boos=
t_1_72_0/boost: foreach_fwd.hpp<br>Only in boost-new/boost_1_72_0/boost: fo=
rmat<br>Only in boost-new/boost_1_72_0/boost: format.hpp<br>Only in boost-n=
ew/boost_1_72_0/boost: function<br>Only in boost-new/boost_1_72_0/boost: fu=
nctional<br>Only in boost-new/boost_1_72_0/boost: generator_iterator.hpp<br=
>Only in boost-new/boost_1_72_0/boost/geometry/srs: esri.hpp<br>Files boost=
-new/boost_1_72_0/boost/geometry/srs/projections/iau2000_traits.hpp and boo=
st-old/boost_1_72_0/boost/geometry/srs/projections/iau2000_traits.hpp diffe=
r<br>Only in boost-new/boost_1_72_0/boost/geometry/srs/projections: spar.hp=
p<br>Only in boost-new/boost_1_72_0/boost/geometry/srs: shared_grids.hpp<br=
>Only in boost-new/boost_1_72_0/boost/geometry/srs: sphere.hpp<br>Only in b=
oost-new/boost_1_72_0/boost/geometry/srs: spheroid.hpp<br>Only in boost-new=
/boost_1_72_0/boost: get_pointer.hpp<br>Only in boost-new/boost_1_72_0/boos=
t: gil<br>Only in boost-new/boost_1_72_0/boost: hana<br>Only in boost-new/b=
oost_1_72_0/boost: hana.hpp<br>Only in boost-new/boost_1_72_0/boost: heap<b=
r></div><div>Only in boost-new/boost_1_72_0/boost: histogram =C2=A0<br>Only=
 in boost-new/boost_1_72_0/boost: integer<br>Only in boost-new/boost_1_72_0=
/boost: iostreams =C2=A0<br>Only in boost-new/boost_1_72_0/boost: is_placeh=
older.hpp<br>Only in boost-new/boost_1_72_0/boost: lambda<br>Only in boost-=
new/boost_1_72_0/boost: locale<br>Only in boost-new/boost_1_72_0/boost: log=
ic<br>Only in boost-new/boost_1_72_0/boost: make_shared.hpp<br>Only in boos=
t-new/boost_1_72_0/boost: math<br>Only in boost-new/boost_1_72_0/boost: mem=
ory_order.hpp<br>Only in boost-new/boost_1_72_0/boost: mp11.hpp =C2=A0 <br>=
Only in boost-new/boost_1_72_0/boost: mpi<br>Only in boost-new/boost_1_72_0=
/boost: multiprecision<br>Only in boost-new/boost_1_72_0/boost: non_type.hp=
p<br>Only in boost-new/boost_1_72_0/boost: operators_v1.hpp<br>Only in boos=
t-new/boost_1_72_0/boost: outcome<br>Only in boost-new/boost_1_72_0/boost: =
outcome.hpp<br>Only in boost-new/boost_1_72_0/boost: pending<br>Only in boo=
st-new/boost_1_72_0/boost: phoenix<br>Only in boost-new/boost_1_72_0/boost:=
 pointee.hpp<br>Only in boost-new/boost_1_72_0/boost: pointer_cast.hpp<br>O=
nly in boost-new/boost_1_72_0/boost: predef.h =C2=A0 <br>Only in boost-new/=
boost_1_72_0/boost: process<br>Only in boost-new/boost_1_72_0/boost: proto<=
br>Only in boost-new/boost_1_72_0/boost: python<br>Only in boost-new/boost_=
1_72_0/boost: random.hpp <br>Only in boost-new/boost_1_72_0/boost: regex.hp=
p =C2=A0<br>Only in boost-new/boost_1_72_0/boost: scope_exit.hpp<br>Only in=
 boost-new/boost_1_72_0/boost: scoped_array.hpp<br>Only in boost-new/boost_=
1_72_0/boost: serialization<br>Only in boost-new/boost_1_72_0/boost: shared=
_container_iterator.hpp<br>Only in boost-new/boost_1_72_0/boost: spirit<br>=
Only in boost-new/boost_1_72_0/boost: stacktrace <br>Only in boost-new/boos=
t_1_72_0/boost: statechart <br>Only in boost-new/boost_1_72_0/boost: token_=
functions.hpp<br>Only in boost-new/boost_1_72_0/boost: type_traits.hpp<br>O=
nly in boost-new/boost_1_72_0/boost: unordered_map.hpp<br>Only in boost-new=
/boost_1_72_0/boost: utility<br>Only in boost-new/boost_1_72_0/boost: varia=
nt2 =C2=A0 <br>Only in boost-new/boost_1_72_0/boost: weak_ptr.hpp<br>Only i=
n boost-new/boost_1_72_0: boost-build.jam =C2=A0<br>Only in boost-new/boost=
_1_72_0: index.html<br>Only in boost-new/boost_1_72_0: more<br>Only in boos=
t-new/boost_1_72_0: rst.css<br>Only in boost-new/boost_1_72_0: tools<br></d=
iv><div><br></div><div>I don&#39;t remember any commit updating the checksu=
m from:</div><div>9df25550eb5a8d5a83dc67be4135d3785ab02b22c6972e5e3da1d7978=
1b03f0b=C2=A0 downloads/boost_1_72_0.tar.bz2_bad-checksum_9df25550eb5a8d5a8=
3dc67be4135d3785ab02b22c6972e5e3da1d79781b03f0b<br></div><div>to</div><div>=
59c9b274bc451cf91a9ba1dd2c7fdcaf5d60b1b3aa83f2c9fa143417cc660722=C2=A0 down=
loads/boost_1_72_0.tar.bz2<br></div><div>currently used in recipe.</div><di=
v><br></div><div>It&#39;s possible that there is another recipe somewhere u=
sing the same=C2=A0boost_1_72_0.tar.bz2 archive from different URL with dif=
ferent checksums.</div><div><br></div><div>Regards,</div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 29, 20=
20 at 3:33 PM Viktor Rosendahl &lt;<a href=3D"mailto:viktor.rosendahl@gmail=
.com">viktor.rosendahl@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">From: Viktor Rosendahl &lt;<a href=3D"mai=
lto:Viktor.Rosendahl@bmw.de" target=3D"_blank">Viktor.Rosendahl@bmw.de</a>&=
gt;<br>
<br>
async_pipe is missing the executor_type type, which is expected by<br>
asio in /usr/include/boost/asio/impl/read.hpp. Without this, it&#39;s<br>
not possible to even compile code that uses constructs such as:<br>
<br>
boost::asio::io_service foo;<br>
boost::process::async_pipe foopipe{ boost::process::async_pipe(foo) };<br>
<br>
This is only relevant for Dunfell because master has already moved to<br>
boost-1.73.0 in which this bug has been fixed. The bug is also not<br>
present in Zeus, which uses boost-1.71.0.<br>
<br>
Signed-off-by: Viktor Rosendahl &lt;<a href=3D"mailto:Viktor.Rosendahl@bmw=
.de" target=3D"_blank">Viktor.Rosendahl@bmw.de</a>&gt;<br>
---<br>
=C2=A0.../0001-added-typedef-executor_type.patch=C2=A0 =C2=A0 | 53 +++++++=
++++++++++++<br>
=C2=A0meta/recipes-support/boost/<a href=3D"http://boost_1.72.0.bb" rel=3D=
"noreferrer" target=3D"_blank">boost_1.72.0.bb</a>=C2=A0 =C2=A0 |=C2=A0 1 +=
<br>
=C2=A02 files changed, 54 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-support/boost/boost/0001-added-typed=
ef-executor_type.patch<br>
<br>
diff --git a/meta/recipes-support/boost/boost/0001-added-typedef-executor_=
type.patch b/meta/recipes-support/boost/boost/0001-added-typedef-executor_t=
ype.patch<br>
new file mode 100644<br>
index 0000000000..83d3749e15<br>
--- /dev/null<br>
+++ b/meta/recipes-support/boost/boost/0001-added-typedef-executor_type.pa=
tch<br>
@@ -0,0 +1,53 @@<br>
+From 6a4d2ff72114ef47c7afaf92e1042aca3dfa41b0 Mon Sep 17 00:00:00 2001<br=
>
+From: Klemens David Morgenstern &lt;<a href=3D"mailto:klemens.morgenstern=
@gmx.net" target=3D"_blank">klemens.morgenstern@gmx.net</a>&gt;<br>
+Date: Fri, 22 Nov 2019 14:03:22 +0800<br>
+Subject: [PATCH] added typedef executor_type;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/boostorg/process=
/commit/6a4d2ff72114ef47c7afaf92e1042aca3dfa41b0" rel=3D"noreferrer" target=
=
=3D"_blank">https://github.com/boostorg/process/commit/6a4d2ff72114ef47c7a=
faf92e1042aca3dfa41b0</a>]<br>
+<br>
+---<br>
+ include/boost/process/async_pipe.hpp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
+ include/boost/process/detail/posix/async_pipe.hpp=C2=A0 =C2=A0| 1 +<br>
+ include/boost/process/detail/windows/async_pipe.hpp | 1 +<br>
+ 3 files changed, 4 insertions(+)<br>
+<br>
+diff --git a/include/boost/process/async_pipe.hpp b/include/boost/process=
/async_pipe.hpp<br>
+index 101fe1d..a562432 100644<br>
+--- a/boost/process/async_pipe.hpp<br>
++++ b/boost/process/async_pipe.hpp<br>
+@@ -47,6 +47,8 @@ public:<br>
+=C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0typedef platform_specific handle_type;<br>
+ <br>
++=C2=A0 =C2=A0 typedef typename handle_type::executor_type executor_type;=
<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0/** Construct a new async_pipe, does automatically op=
en the pipe.<br>
+=C2=A0 =C2=A0 =C2=A0 * Initializes source and sink with the same io_conte=
xt.<br>
+=C2=A0 =C2=A0 =C2=A0 * @note Windows creates a named pipe here, where the=
 name is automatically generated.<br>
+diff --git a/include/boost/process/detail/posix/async_pipe.hpp b/include/=
boost/process/detail/posix/async_pipe.hpp<br>
+index 725a078..a82c057 100644<br>
+--- a/boost/process/detail/posix/async_pipe.hpp<br>
++++ b/boost/process/detail/posix/async_pipe.hpp<br>
+@@ -23,6 +23,7 @@ class async_pipe<br>
+ public:<br>
+=C2=A0 =C2=A0 =C2=A0typedef int native_handle_type;<br>
+=C2=A0 =C2=A0 =C2=A0typedef ::boost::asio::posix::stream_descriptor handl=
e_type;<br>
++=C2=A0 =C2=A0 typedef typename handle_type::executor_type executor_type;=
<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0inline async_pipe(boost::asio::io_context &amp; ios) =
: async_pipe(ios, ios) {}<br>
+ <br>
+diff --git a/include/boost/process/detail/windows/async_pipe.hpp b/includ=
e/boost/process/detail/windows/async_pipe.hpp<br>
+index 06d5f2d..0b447f9 100644<br>
+--- a/boost/process/detail/windows/async_pipe.hpp<br>
++++ b/boost/process/detail/windows/async_pipe.hpp<br>
+@@ -48,6 +48,7 @@ class async_pipe<br>
+ public:<br>
+=C2=A0 =C2=A0 =C2=A0typedef ::boost::winapi::HANDLE_ native_handle_type;<=
br>
+=C2=A0 =C2=A0 =C2=A0typedef ::boost::asio::windows::stream_handle=C2=A0 =
=C2=A0handle_type;<br>
++=C2=A0 =C2=A0 typedef typename handle_type::executor_type executor_type;=
<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0async_pipe(boost::asio::io_context &amp; ios) : async=
_pipe(ios, ios, make_pipe_name(), true) {}<br>
+=C2=A0 =C2=A0 =C2=A0async_pipe(boost::asio::io_context &amp; ios_source, =
boost::asio::io_context &amp; ios_sink)<br>
+-- <br>
+2.17.1<br>
+<br>
diff --git a/meta/recipes-support/boost/<a href=3D"http://boost_1.72.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">boost_1.72.0.bb</a> b/meta/recipes-su=
pport/boost/<a href=3D"http://boost_1.72.0.bb" rel=3D"noreferrer" target=3D=
"_blank">boost_1.72.0.bb</a><br>
index 0b7badbc76..51c84bc935 100644<br>
--- a/meta/recipes-support/boost/<a href=3D"http://boost_1.72.0.bb" rel=3D=
"noreferrer" target=3D"_blank">boost_1.72.0.bb</a><br>
+++ b/meta/recipes-support/boost/<a href=3D"http://boost_1.72.0.bb" rel=3D=
"noreferrer" target=3D"_blank">boost_1.72.0.bb</a><br>
@@ -8,4 +8,5 @@ SRC_URI +=3D &quot;file://arm-intrinsics.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Don-t-set-up-arch-in=
struction-set-flags-we-do-that-o.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-dont-setup-compiler-=
flags-m32-m64.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-revert-cease-depende=
nce-on-range.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-added-typedef-execut=
or_type.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote></div>

--000000000000d8c4a305b1139850--
