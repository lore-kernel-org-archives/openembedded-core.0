Return-Path: <peter@berginkonsult.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1BC9C77B7C
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 19:15:50 +0000 (UTC)
Received: from mailrelay1-2.pub.mailoutpod2-cph3.one.com (mailrelay1-2.pub.mailoutpod2-cph3.one.com [46.30.211.182])
 by mx.groups.io with SMTP id smtpd.web11.4511.1683314143276858595
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 12:15:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa2 header.b=FTTE7MPk;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.211.182, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=rsa2;
	h=in-reply-to:from:references:cc:to:subject:mime-version:date:message-id:
	 content-type:from;
	bh=9qeqgXcGdN17P/5NUyyMni0hb3y3fr8PHqThiWvp5nE=;
	b=FTTE7MPkxZXlsG9eIkmtXZtL7WOwkNMwzFpCSYHhtjnHleA1h6yY8+2Uoy+4CxD1qE4G0spJf6ZhU
	 P22BXlT5ZCQo5Htyliq9ANd95ylO9boxUPjM4Jhj0TMACH8r95MBWyXXXWjxl4kZQ1LRQxlV0sBJah
	 LFEhmNlCbc83aPcgmoIRoGJfe33xXNxsWsXUqgFbK7EG1u2aDZ0xpkEWw62DVqYABA1Hm/FICt9g6h
	 rrjDTzIddoTTc/OteYdOJ88KM28CiowmOTu/GC6Pdx9OxZDOw7niUmTdVi58NHT+QmXNtRpgc2yOMJ
	 oNwHz22p3pHmbM5lKmHolP2Vwx48wnA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=ed2;
	h=in-reply-to:from:references:cc:to:subject:mime-version:date:message-id:
	 content-type:from;
	bh=9qeqgXcGdN17P/5NUyyMni0hb3y3fr8PHqThiWvp5nE=;
	b=DpbwKEPETCLdUlRmlskhxKhC4d9nAVoH7is1pNDvpP8so4kzHaY+7dNp6zsTt4/rqKQO94nPj7KhT
	 EcVg2hhAA==
X-HalOne-ID: 38a1f180-eb79-11ed-a031-99461c6a3fe8
Received: from [192.168.100.35] (c-799071d5.44006-0-69747578.bbcust.telenor.se [213.113.144.121])
	by mailrelay1 (Halon) with ESMTPSA
	id 38a1f180-eb79-11ed-a031-99461c6a3fe8;
	Fri, 05 May 2023 19:15:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------vUreYJPmVsEAg684rath6JC3"
Message-ID: <a1f49593-d4bf-8db8-22e8-5e115782bdf8@berginkonsult.se>
Date: Fri, 5 May 2023 21:15:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] [RFC] python3-cryptogaphy upgrade to 40.0.2 issues
Content-Language: en-US
To: Tim Orling <ticotimo@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 frederic.martinsons@gmail.com,
 openembedded-core <openembedded-core@lists.openembedded.org>
References: <CANx9H-B4seY487YwfvgW2ze_n6MWr73kJsOTc8spdou32qubKg@mail.gmail.com>
 <57f1224b-14c5-2ba4-c752-98dba8f57a21@berginkonsult.se>
 <CANNYZj-uE2WUvfZpjq67wHyeFqQaN1L7HYp54Fm99J5UzS8cdw@mail.gmail.com>
 <98af3b96-9d1c-3d6a-493f-c1d6a422f9e8@berginkonsult.se>
 <CANx9H-Cf6wTwVx40=Su=HSMJoydX4Ppe1CN+jo5fRWpfVaJkVA@mail.gmail.com>
From: Peter Bergin <peter@berginkonsult.se>
In-Reply-To: <CANx9H-Cf6wTwVx40=Su=HSMJoydX4Ppe1CN+jo5fRWpfVaJkVA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 19:15:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180973

This is a multi-part message in MIME format.
--------------vUreYJPmVsEAg684rath6JC3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

a short status update:

On 2023-05-05 06:01, Tim Orling wrote:
>
>
> On Thu, May 4, 2023 at 5:00 AM Peter Bergin <peter@berginkonsult.se> 
> wrote:
>
>
>     On 2023-05-04 11:00, Alexander Kanavin wrote:
>     > On Thu, 4 May 2023 at 10:41, Peter Bergin
>     <peter@berginkonsult.se> wrote:
>     >
>     >> At
>     >>
>     https://github.com/pyca/cryptography/blob/f816b457494e010b655cd7fdcd30e3446f86a703/src/rust/build.rs#L46
>     >> the path to python includes is defined by calling 'python3 -c
>     "import
>     >> sysconfig; print(sysconfig.get_path('include'))"' (but from inside
>     >> rust). With print-debugging this seems to return the bad string
>     >> '/usr/include/python3.11' which is then passed to cc::Build
>     >>
>     >> I executed this in recipe context:
>     >>
>     >> do_compile:prepend() {
>     >>       which python3
>     >>       python3 -c "import sysconfig;
>     print(sysconfig.get_path('include'))"
>     >> }
>     >>
>     >> and then I got the correct return value:
>     >>
>     >> |
>     >>
>     /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native/usr/bin/python3-native/python3
>     >> |
>     >>
>     /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native/usr/include/python3.11
>     > This is pointing to the native sysroot in a target build, so it is
>     > most likely not actually correct. I believe 'inherit
>     > python3targetconfig' may help, as it substitutes most places where
>     > native python gets queried by components with target-specific
>     values.
>     >
>     > Alex
>     >
>     The bad thing is that the build.rs <http://build.rs> script is
>     running python script to
>     figure out the path to the headers. I'm not sure we can use target
>     python exe in the build steps without running qemu instance or
>     something
>     which seems overkill in this case. We have the information about
>     python
>     include path for the target in the variable PYTHON_INCLUDE_DIR.
>
>     With this patch the compilation will find Python.h:
>
>     $ git diff src/rust/build.rs <http://build.rs>
>     diff --git a/src/rust/build.rs <http://build.rs>
>     b/src/rust/build.rs <http://build.rs>
>     index 01177ac..7dc13fe 100644
>     --- a/src/rust/build.rs <http://build.rs>
>     +++ b/src/rust/build.rs <http://build.rs>
>     @@ -43,11 +43,8 @@ fn main() {
>           )
>           .unwrap();
>     println!("cargo:rustc-cfg=python_implementation=\"{}\"", python_impl);
>     -    let python_include = run_python_script(
>     -        &python,
>     -        "import sysconfig; print(sysconfig.get_path('include'),
>     end='')",
>     -    )
>     -    .unwrap();
>     +    let python_include = env::var("PYTHON_INCLUDE_DIR").unwrap();
>     +
>           let openssl_include =
>     std::env::var_os("DEP_OPENSSL_INCLUDE").expect("unable to find
>     openssl include path");
>           let openssl_c = Path::new(&out_dir).join("_openssl.c");
>
>
> This patch at least got `python3-cryptography-native` to build to 
> completion.

And I was also able to build python3-cryptography for 'qemuarm64'. 
Opened an issue at https://github.com/pyca/cryptography/issues/8867 to 
see if it is something to be fixed upstream.

>
>     But it fails later in the linking step.
>
>     .....linux/python3-cryptography/40.0.2-r0/recipe-sysroot/usr/lib/rustlib/x86_64-poky-linux-gnu/lib"
>
>     "-L"
>     "/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/python3-cryptography-40.0.2/target/x86_64-poky-linux-gnu/release/build/cryptography-rust-aa00e39a952c07ee/out"
>
>     "-L"
>     "/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot/usr/lib"
>
>     "-L"
>     "/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native/usr/lib/rustlib/x86_64-poky-linux-gnu/lib"
>
>     "-Wl,-Bstatic" "-l_openssl.a"
>     "/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot/usr/lib/rustlib/x86_64-poky-linux-gnu/lib/libcompiler_builtins-45df5d471f0d20d0.rlib"
>
>     "-Wl,-Bdynamic" "-lssl" "-lcrypto" "-lgcc_s" "-lutil" "-lrt"
>     "-lpthread"
>     "-lm" "-ldl" "-lc" "-Wl,--eh-frame-hdr" "-Wl,-znoexecstack" "-L"
>     "/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native/usr/lib/rustlib/x86_64-poky-linux-gnu/lib"
>
>     "-o"
>     "/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/python3-cryptography-40.0.2/target/x86_64-poky-linux-gnu/release/deps/libcryptography_rust.so"
>
>     "-Wl,--gc-sections" "-shared" "-Wl,-O1" "-nodefaultlibs"
>        = note:
>     /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/12.2.0/ld:
>
>     /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/python3-cryptography-40.0.2/target/x86_64-poky-linux-gnu/release/build/cryptography-rust-aa00e39a952c07ee/out/lib_openssl.a.a(9bdf47a443b7a07f-_openssl.o):
>
>     warning: relocation against `_Py_NoneStruct' in read-only section
>     `.text'
>     /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/12.2.0/ld:
>
>     /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/python3-cryptography-40.0.2/target/x86_64-poky-linux-gnu/release/build/cryptography-rust-aa00e39a952c07ee/out/lib_openssl.a.a(9bdf47a443b7a07f-_openssl.o):
>
>     relocation R_X86_64_PC32 against undefined symbol `_Py_NoneStruct'
>     can
>     not be used when making a shared object; recompile with -fPIC
>     /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/12.2.0/ld:
>
>     final link failed: bad value
>                collect2: error: ld returned 1 exit status
>
>
As I was able to complete a build for 'qemuarm64' but it fails on 
'qemux86_64' I am now trying to find differences....  Help appreciated! 
I have compared on the level of rust and how cargo is called and I can 
not find any difference apart from '-target [x86|aarch]64-poky-linux-gnu'.

My thoughts is that it can have to do with the binding to openssl and 
how it is built. Found an old issue 
(https://www.openembedded.org/pipermail/openembedded-core/2016-December/130334.html) 
with similar error message. But I'm not sure how it is related and 
neither how openssl integrates in to the build, I guess it is through 
openssl-sys. Any ideas around this are welcome. Is there a difference in 
'-fPIC' between x86_64 and arm64?

/Peter


--------------vUreYJPmVsEAg684rath6JC3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,</p>
    <p>a short status update:<br>
    </p>
    <div class="moz-cite-prefix">On 2023-05-05 06:01, Tim Orling wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANx9H-Cf6wTwVx40=Su=HSMJoydX4Ppe1CN+jo5fRWpfVaJkVA@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div>
        <div dir="ltr">
          <div dir="ltr"><br>
          </div>
          <br>
        </div>
      </div>
      <div>
        <div dir="ltr">
          <div class="gmail_quote">
            <div dir="ltr" class="gmail_attr">On Thu, May 4, 2023 at
              5:00 AM Peter Bergin &lt;<a
                href="mailto:peter@berginkonsult.se" target="_blank"
                moz-do-not-send="true" class="moz-txt-link-freetext">peter@berginkonsult.se</a>&gt;
              wrote:<br>
            </div>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
              0.8ex;border-left:1px solid
              rgb(204,204,204);padding-left:1ex"><br>
              On 2023-05-04 11:00, Alexander Kanavin wrote:<br>
              &gt; On Thu, 4 May 2023 at 10:41, Peter Bergin &lt;<a
                href="mailto:peter@berginkonsult.se" target="_blank"
                moz-do-not-send="true" class="moz-txt-link-freetext">peter@berginkonsult.se</a>&gt;
              wrote:<br>
              &gt;<br>
              &gt;&gt; At<br>
              &gt;&gt; <a
href="https://github.com/pyca/cryptography/blob/f816b457494e010b655cd7fdcd30e3446f86a703/src/rust/build.rs#L46"
                rel="noreferrer" target="_blank" moz-do-not-send="true"
                class="moz-txt-link-freetext">https://github.com/pyca/cryptography/blob/f816b457494e010b655cd7fdcd30e3446f86a703/src/rust/build.rs#L46</a><br>
              &gt;&gt; the path to python includes is defined by calling
              'python3 -c "import<br>
              &gt;&gt; sysconfig; print(sysconfig.get_path('include'))"'
              (but from inside<br>
              &gt;&gt; rust). With print-debugging this seems to return
              the bad string<br>
              &gt;&gt; '/usr/include/python3.11' which is then passed to
              cc::Build<br>
              &gt;&gt;<br>
              &gt;&gt; I executed this in recipe context:<br>
              &gt;&gt;<br>
              &gt;&gt; do_compile:prepend() {<br>
              &gt;&gt;       which python3<br>
              &gt;&gt;       python3 -c "import sysconfig;
              print(sysconfig.get_path('include'))"<br>
              &gt;&gt; }<br>
              &gt;&gt;<br>
              &gt;&gt; and then I got the correct return value:<br>
              &gt;&gt;<br>
              &gt;&gt; |<br>
              &gt;&gt;
/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native/usr/bin/python3-native/python3<br>
              &gt;&gt; |<br>
              &gt;&gt;
/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native/usr/include/python3.11<br>
              &gt; This is pointing to the native sysroot in a target
              build, so it is<br>
              &gt; most likely not actually correct. I believe 'inherit<br>
              &gt; python3targetconfig' may help, as it substitutes most
              places where<br>
              &gt; native python gets queried by components with
              target-specific values.<br>
              &gt;<br>
              &gt; Alex<br>
              &gt;<br>
              The bad thing is that the <a href="http://build.rs"
                rel="noreferrer" target="_blank" moz-do-not-send="true">build.rs</a>
              script is running python script to <br>
              figure out the path to the headers. I'm not sure we can
              use target <br>
              python exe in the build steps without running qemu
              instance or something <br>
              which seems overkill in this case. We have the information
              about python <br>
              include path for the target in the variable
              PYTHON_INCLUDE_DIR.<br>
              <br>
              With this patch the compilation will find Python.h:<br>
              <br>
              $ git diff src/rust/<a href="http://build.rs"
                rel="noreferrer" target="_blank" moz-do-not-send="true">build.rs</a><br>
              diff --git a/src/rust/<a href="http://build.rs"
                rel="noreferrer" target="_blank" moz-do-not-send="true">build.rs</a>
              b/src/rust/<a href="http://build.rs" rel="noreferrer"
                target="_blank" moz-do-not-send="true">build.rs</a><br>
              index 01177ac..7dc13fe 100644<br>
              --- a/src/rust/<a href="http://build.rs" rel="noreferrer"
                target="_blank" moz-do-not-send="true">build.rs</a><br>
              +++ b/src/rust/<a href="http://build.rs" rel="noreferrer"
                target="_blank" moz-do-not-send="true">build.rs</a><br>
              @@ -43,11 +43,8 @@ fn main() {<br>
                    )<br>
                    .unwrap();<br>
                   
              println!("cargo:rustc-cfg=python_implementation=\"{}\"",
              python_impl);<br>
              -    let python_include = run_python_script(<br>
              -        &amp;python,<br>
              -        "import sysconfig;
              print(sysconfig.get_path('include'), end='')",<br>
              -    )<br>
              -    .unwrap();<br>
              +    let python_include =
              env::var("PYTHON_INCLUDE_DIR").unwrap();<br>
              +<br>
                    let openssl_include =<br>
                       
              std::env::var_os("DEP_OPENSSL_INCLUDE").expect("unable to
              find <br>
              openssl include path");<br>
                    let openssl_c =
              Path::new(&amp;out_dir).join("_openssl.c");<br>
              <br>
            </blockquote>
            <div><br>
            </div>
          </div>
        </div>
      </div>
      <div>
        <div dir="ltr">
          <div class="gmail_quote">
            <div>This patch at least got `python3-cryptography-native`
              to build to completion.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>And I was also able to build python3-cryptography for
      'qemuarm64'. Opened an issue at
      <a class="moz-txt-link-freetext" href="https://github.com/pyca/cryptography/issues/8867">https://github.com/pyca/cryptography/issues/8867</a> to see if it is
      something to be fixed upstream.<br>
    </p>
    <blockquote type="cite"
cite="mid:CANx9H-Cf6wTwVx40=Su=HSMJoydX4Ppe1CN+jo5fRWpfVaJkVA@mail.gmail.com">
      <div>
        <div dir="ltr">
          <div class="gmail_quote">
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
              0.8ex;border-left:1px solid
              rgb(204,204,204);padding-left:1ex">
              <br>
              But it fails later in the linking step.<br>
              <br>
.....linux/python3-cryptography/40.0.2-r0/recipe-sysroot/usr/lib/rustlib/x86_64-poky-linux-gnu/lib"
              <br>
              "-L" <br>
"/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/python3-cryptography-40.0.2/target/x86_64-poky-linux-gnu/release/build/cryptography-rust-aa00e39a952c07ee/out"
              <br>
              "-L" <br>
"/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot/usr/lib"
              <br>
              "-L" <br>
"/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native/usr/lib/rustlib/x86_64-poky-linux-gnu/lib"
              <br>
              "-Wl,-Bstatic" "-l_openssl.a" <br>
"/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot/usr/lib/rustlib/x86_64-poky-linux-gnu/lib/libcompiler_builtins-45df5d471f0d20d0.rlib"
              <br>
              "-Wl,-Bdynamic" "-lssl" "-lcrypto" "-lgcc_s" "-lutil"
              "-lrt" "-lpthread" <br>
              "-lm" "-ldl" "-lc" "-Wl,--eh-frame-hdr"
              "-Wl,-znoexecstack" "-L" <br>
"/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native/usr/lib/rustlib/x86_64-poky-linux-gnu/lib"
              <br>
              "-o" <br>
"/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/python3-cryptography-40.0.2/target/x86_64-poky-linux-gnu/release/deps/libcryptography_rust.so"
              <br>
              "-Wl,--gc-sections" "-shared" "-Wl,-O1" "-nodefaultlibs"<br>
                 = note: <br>
/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/12.2.0/ld:
              <br>
/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/python3-cryptography-40.0.2/target/x86_64-poky-linux-gnu/release/build/cryptography-rust-aa00e39a952c07ee/out/lib_openssl.a.a(9bdf47a443b7a07f-_openssl.o):
              <br>
              warning: relocation against `_Py_NoneStruct' in read-only
              section `.text'<br>
/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/12.2.0/ld:
              <br>
/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/python3-cryptography-40.0.2/target/x86_64-poky-linux-gnu/release/build/cryptography-rust-aa00e39a952c07ee/out/lib_openssl.a.a(9bdf47a443b7a07f-_openssl.o):
              <br>
              relocation R_X86_64_PC32 against undefined symbol
              `_Py_NoneStruct' can <br>
              not be used when making a shared object; recompile with
              -fPIC<br>
/work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/12.2.0/ld:
              <br>
              final link failed: bad value<br>
                         collect2: error: ld returned 1 exit status<br>
              <br>
              <br>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
    <p>As I was able to complete a build for 'qemuarm64' but it fails on
      'qemux86_64' I am now trying to find differences....  Help
      appreciated! I have compared on the level of rust and how cargo is
      called and I can not find any difference apart from '-target
      [x86|aarch]64-poky-linux-gnu'.<br>
    </p>
    <p>My thoughts is that it can have to do with the binding to openssl
      and how it is built. Found an old issue
(<a class="moz-txt-link-freetext" href="https://www.openembedded.org/pipermail/openembedded-core/2016-December/130334.html">https://www.openembedded.org/pipermail/openembedded-core/2016-December/130334.html</a>)
      with similar error message. But I'm not sure how it is related and
      neither how openssl integrates in to the build, I guess it is
      through openssl-sys. Any ideas around this are welcome. Is there a
      difference in '-fPIC' between x86_64 and arm64?<br>
    </p>
    <p>/Peter<br>
    </p>
    <br>
  </body>
</html>

--------------vUreYJPmVsEAg684rath6JC3--

