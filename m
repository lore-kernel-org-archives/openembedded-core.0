X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Subject: Re: [OE-core] rust - relocation error when setting up SDK
References: <16B84E970A0F3237.19985@lists.openembedded.org>
From: "Peter Bergin" <peter@berginkonsult.se>
Message-ID: <d7b5ded8-807c-1f79-7321-6887e54c369d@berginkonsult.se>
Date: Mon, 29 Nov 2021 09:01:10 +0100
MIME-Version: 1.0
In-Reply-To: <16B84E970A0F3237.19985@lists.openembedded.org>
Content-Type: multipart/alternative;
 boundary="------------AF908C0120778C51F1F09E54"
Content-Language: en-US
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

--------------AF908C0120778C51F1F09E54
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

Not much around this and I opened a bugzilla issue: 
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14640

/Peter

On 2021-11-17 11:27, Peter Bergin wrote:
> Hi,
>
> I'm trying to explore how to add and use rust in the SDK for 
> cross-compilation. When installing and setting up a SDK with 
> packagegroup-rust-cross-canadian it fails if the installation path is 
> too long. I have found similar issues in meta-rust [1] and some other 
> setup [2] but can not directly find a solution to the problem by 
> myself. I'm open for help and ideas how to solve this.
>
> Steps to reproduce:
>
>   <setup standard poky build, qemux86_64>
>   $ echo 'TOOLCHAIN_HOST_TASK:append = " 
> packagegroup-rust-cross-canadian-${MACHINE}"' >> conf/auto.conf
>   $ bitbake core-image-minimal -cpopulate_sdk
>
>   <installation>
>   $ 
> ./tmp/deploy/sdk/poky-glibc-x86_64-core-image-minimal-core2-64-qemux86-64-toolchain-3.4+snapshot.sh 
>
>   Poky (Yocto Project Reference Distro) SDK installer version 
> 3.4+snapshot
> ========================================================================
>   Enter target directory for SDK (default: /opt/poky/3.4+snapshot): 
> /work/sdk/install/sdk/to/a/really/long/path
>   You are about to install the SDK to 
> "/work/sdk/install/sdk/to/a/really/long/path". Proceed [Y/n]? y
>   Extracting 
> SDK....................................................................................done 
>
>   Setting it up...ERROR: could not relocate 
> /work/sdk/install/sdk/to/a/really/long/path/sysroots/x86_64-pokysdk-linux/usr/bin/cargo-clippy, 
> interp size = 84 and 99 is needed.
>   ERROR: could not relocate 
> /work/sdk/install/sdk/to/a/really/long/path/sysroots/x86_64-pokysdk-linux/usr/bin/cargo, 
> interp size = 84 and 99 is needed.
>   ERROR: could not relocate 
> /work/sdk/install/sdk/to/a/really/long/path/sysroots/x86_64-pokysdk-linux/usr/bin/rustfmt, 
> interp size = 84 and 99 is needed.
>   ERROR: could not relocate 
> /work/sdk/install/sdk/to/a/really/long/path/sysroots/x86_64-pokysdk-linux/usr/bin/rustdoc, 
> interp size = 84 and 99 is needed.
>   ERROR: could not relocate 
> /work/sdk/install/sdk/to/a/really/long/path/sysroots/x86_64-pokysdk-linux/usr/bin/rustc, 
> interp size = 84 and 99 is needed.
>   ERROR: could not relocate 
> /work/sdk/install/sdk/to/a/really/long/path/sysroots/x86_64-pokysdk-linux/usr/bin/clippy-driver, 
> interp size = 84 and 99 is needed.
>   ERROR: could not relocate 
> /work/sdk/install/sdk/to/a/really/long/path/sysroots/x86_64-pokysdk-linux/usr/lib/x86_64-poky-linux/rustlib/x86_64-unknown-linux-gnu/bin/rust-llvm-dwp, 
> interp size = 84 and 99 is needed.
>   done
>   SDK has been successfully set up and is ready to be used.
>   Each time you wish to use the SDK in a new shell session, you need 
> to source the environment setup script e.g.
>    $ . 
> /work/sdk/install/sdk/to/a/really/long/path/environment-setup-core2-64-poky-linux 
>
>
>
> The workaround is fairly easy and it is to install the SDK to a 
> shorter path. In that sense this is no big blocker but if we can find 
> an easy solution it would be good.
>
> Best Regards,
> /Peter
>
> [1] https://github.com/kraj/meta-clang/issues/119
>
> [2] https://lists.yoctoproject.org/g/yocto/message/48173
>
>
> 
>

--------------AF908C0120778C51F1F09E54
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Not much around this and I opened a bugzilla issue:
      <a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=14640">https://bugzilla.yoctoproject.org/show_bug.cgi?id=14640</a></p>
    <p>/Peter<br>
    </p>
    <div class="moz-cite-prefix">On 2021-11-17 11:27, Peter Bergin
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:16B84E970A0F3237.19985@lists.openembedded.org">Hi,
      <br>
      <br>
      I'm trying to explore how to add and use rust in the SDK for
      cross-compilation. When installing and setting up a SDK with
      packagegroup-rust-cross-canadian it fails if the installation path
      is too long. I have found similar issues in meta-rust [1] and some
      other setup [2] but can not directly find a solution to the
      problem by myself. I'm open for help and ideas how to solve this.
      <br>
      <br>
      Steps to reproduce:
      <br>
      <br>
        &lt;setup standard poky build, qemux86_64&gt;
      <br>
        $ echo 'TOOLCHAIN_HOST_TASK:append = "
      packagegroup-rust-cross-canadian-${MACHINE}"' &gt;&gt;
      conf/auto.conf
      <br>
        $ bitbake core-image-minimal -cpopulate_sdk
      <br>
      <br>
        &lt;installation&gt;
      <br>
        $
./tmp/deploy/sdk/poky-glibc-x86_64-core-image-minimal-core2-64-qemux86-64-toolchain-3.4+snapshot.sh
      <br>
        Poky (Yocto Project Reference Distro) SDK installer version
      3.4+snapshot
      <br>
========================================================================
      <br>
        Enter target directory for SDK (default:
      /opt/poky/3.4+snapshot):
      /work/sdk/install/sdk/to/a/really/long/path
      <br>
        You are about to install the SDK to
      "/work/sdk/install/sdk/to/a/really/long/path". Proceed [Y/n]? y
      <br>
        Extracting
SDK....................................................................................done
      <br>
        Setting it up...ERROR: could not relocate
/work/sdk/install/sdk/to/a/really/long/path/sysroots/x86_64-pokysdk-linux/usr/bin/cargo-clippy,
      interp size = 84 and 99 is needed.
      <br>
        ERROR: could not relocate
/work/sdk/install/sdk/to/a/really/long/path/sysroots/x86_64-pokysdk-linux/usr/bin/cargo,
      interp size = 84 and 99 is needed.
      <br>
        ERROR: could not relocate
/work/sdk/install/sdk/to/a/really/long/path/sysroots/x86_64-pokysdk-linux/usr/bin/rustfmt,
      interp size = 84 and 99 is needed.
      <br>
        ERROR: could not relocate
/work/sdk/install/sdk/to/a/really/long/path/sysroots/x86_64-pokysdk-linux/usr/bin/rustdoc,
      interp size = 84 and 99 is needed.
      <br>
        ERROR: could not relocate
/work/sdk/install/sdk/to/a/really/long/path/sysroots/x86_64-pokysdk-linux/usr/bin/rustc,
      interp size = 84 and 99 is needed.
      <br>
        ERROR: could not relocate
/work/sdk/install/sdk/to/a/really/long/path/sysroots/x86_64-pokysdk-linux/usr/bin/clippy-driver,
      interp size = 84 and 99 is needed.
      <br>
        ERROR: could not relocate
/work/sdk/install/sdk/to/a/really/long/path/sysroots/x86_64-pokysdk-linux/usr/lib/x86_64-poky-linux/rustlib/x86_64-unknown-linux-gnu/bin/rust-llvm-dwp,
      interp size = 84 and 99 is needed.
      <br>
        done
      <br>
        SDK has been successfully set up and is ready to be used.
      <br>
        Each time you wish to use the SDK in a new shell session, you
      need to source the environment setup script e.g.
      <br>
         $ .
/work/sdk/install/sdk/to/a/really/long/path/environment-setup-core2-64-poky-linux
      <br>
      <br>
      <br>
      The workaround is fairly easy and it is to install the SDK to a
      shorter path. In that sense this is no big blocker but if we can
      find an easy solution it would be good.
      <br>
      <br>
      Best Regards,
      <br>
      /Peter
      <br>
      <br>
      [1] <a class="moz-txt-link-freetext" href="https://github.com/kraj/meta-clang/issues/119">https://github.com/kraj/meta-clang/issues/119</a>
      <br>
      <br>
      [2] <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/yocto/message/48173">https://lists.yoctoproject.org/g/yocto/message/48173</a>
      <br>
      <br>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------AF908C0120778C51F1F09E54--
