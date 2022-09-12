X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <d281b0c3-6525-86f0-254f-7c16f7ac0462@berginkonsult.se>
Date: Mon, 12 Sep 2022 14:46:58 +0200
MIME-Version: 1.0
Subject: Re: [OE-core] Kirkstone Rust - native only error
References: <CABKMkP+m5xNYv5aDL-YM=xbaOx+dnYEiZQbMm4wFmk=FTB+M1Q@mail.gmail.com>
From: "Peter Bergin" <peter@berginkonsult.se>
In-Reply-To: <CABKMkP+m5xNYv5aDL-YM=xbaOx+dnYEiZQbMm4wFmk=FTB+M1Q@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------2PaokyQymQD0IATN05Pyp0c6"
Content-Language: en-US
List-id: <openembedded-core.lists.openembedded.org>
To: Joel Winarske <joel.winarske@gmail.com>
Cc: OE-core <Openembedded-core@lists.openembedded.org>

--------------2PaokyQymQD0IATN05Pyp0c6
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

Hi Joel,

On 2022-09-11 03:00, Joel Winarske wrote:
> I'm putting together a recipe that requires two passes, native, then 
> target.  I'm hitting a python error only in the native pass.  I can 
> cross compile the tool without error, so the problem is  isolated to 
> native.  Any ideas?
>
> Recipe is progress:
> https://github.com/meta-flutter/meta-flutter/blob/jw/membrane/recipes-devtools/membrane/membrane-example_git.bb
>
> Thanks,
> Joel
>
> | error: linking with 
> `/__w/meta-flutter/yocto-kirkstone/build/tmp/work/x86_64-linux/membrane-example-native/git.AUTOINC+4e788100fc-r0/wrapper/target-rust-ccld` 
> failed: exit status: 1
> 528 
> <https://github.com/meta-flutter/meta-flutter/runs/8288580694?check_suite_focus=true#step:9:529>| 
> |
> 529 
> <https://github.com/meta-flutter/meta-flutter/runs/8288580694?check_suite_focus=true#step:9:530>| 
> = note: 
> "/__w/meta-flutter/yocto-kirkstone/build/tmp/work/x86_64-linux/membrane-example-native/git.AUTOINC+4e788100fc-r0/wrapper/target-rust-ccld" 
> "/__w/meta-flutter/yocto-kirkstone/build/tmp/work/x86_64-linux/membrane-example-native/git.AUTOINC+4e788100fc-r0/build/target/debug/build/parking_lot_core-e7575e9f22c0f65d/build_script_build-e7575e9f22c0f65d.build_script_build.c34fd75e-cgu.0.rcgu.o" 
> "/__w/meta-flutter/yocto-kirkstone/build/tmp/work/x86_64-linux/membrane-example-native/git.AUTOINC+4e788100fc-r0/build/target/debug/build/parking_lot_core-e7575e9f22c0f65d/build_script_build-e7575e9f22c0f65d.build_script_build.c34fd75e-cgu.1.rcgu.o" 
> "/__w/meta-flutter/yocto-kirkstone/build/tmp/work/x86_64-linux/membrane-example-native/git.AUTOINC+4e788100fc-r0/build/target/debug/build/parking_lot_core-e7575e9f22c0f65d/build_script_build-e7575e9f22c0f65d.build_script_build.c34fd75e-cgu.10.rcgu.o" 
> "/__w/meta-flutter/yocto-kirkstone/build/tmp/work/x86_64-linux/membrane-example-native/git.AUTOINC+4e788100fc-r0/build/tar... 
>
> 530 
> <https://github.com/meta-flutter/meta-flutter/runs/8288580694?check_suite_focus=true#step:9:531>| 
> = note: Traceback (most recent call last):
> 531 
> <https://github.com/meta-flutter/meta-flutter/runs/8288580694?check_suite_focus=true#step:9:532>| 
> File 
> "/__w/meta-flutter/yocto-kirkstone/build/tmp/work/x86_64-linux/membrane-example-native/git.AUTOINC+4e788100fc-r0/wrapper/target-rust-ccld", 
> line 6, in <module>
> 532 
> <https://github.com/meta-flutter/meta-flutter/runs/8288580694?check_suite_focus=true#step:9:533>| 
> os.execvp(binary, args)
> 533 
> <https://github.com/meta-flutter/meta-flutter/runs/8288580694?check_suite_focus=true#step:9:534>| 
> File 
> "/__w/meta-flutter/yocto-kirkstone/build/tmp/work/x86_64-linux/membrane-example-native/git.AUTOINC+4e788100fc-r0/recipe-sysroot-native/usr/lib/python3.10/os.py", 
> line 574, in execvp
> 534 
> <https://github.com/meta-flutter/meta-flutter/runs/8288580694?check_suite_focus=true#step:9:535>| 
> _execvpe(file, args)
> 535 
> <https://github.com/meta-flutter/meta-flutter/runs/8288580694?check_suite_focus=true#step:9:536>| 
> File 
> "/__w/meta-flutter/yocto-kirkstone/build/tmp/work/x86_64-linux/membrane-example-native/git.AUTOINC+4e788100fc-r0/recipe-sysroot-native/usr/lib/python3.10/os.py", 
> line 616, in _execvpe
> 536 
> <https://github.com/meta-flutter/meta-flutter/runs/8288580694?check_suite_focus=true#step:9:537>| 
> raise last_exc
> 537 
> <https://github.com/meta-flutter/meta-flutter/runs/8288580694?check_suite_focus=true#step:9:538>| 
> File 
> "/__w/meta-flutter/yocto-kirkstone/build/tmp/work/x86_64-linux/membrane-example-native/git.AUTOINC+4e788100fc-r0/recipe-sysroot-native/usr/lib/python3.10/os.py", 
> line 607, in _execvpe
> 538 
> <https://github.com/meta-flutter/meta-flutter/runs/8288580694?check_suite_focus=true#step:9:539>| 
> exec_func(fullname, *argrest)
> 539 
> <https://github.com/meta-flutter/meta-flutter/runs/8288580694?check_suite_focus=true#step:9:540>| 
> FileNotFoundError: [Errno 2] No such file or directory
>
Just looking at the last line and the error it looks similar to what I 
hunted for in this thread. 
https://lists.openembedded.org/g/openembedded-core/topic/93200332#169698 
Could probably be something similar. In that case the build used wrong 
interpreter. I hope it can help you somewhere.

/Peter


--------------2PaokyQymQD0IATN05Pyp0c6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>Hi Joel,<br>
    </p>
    <div class=3D"moz-cite-prefix">On 2022-09-11 03:00, Joel Winarske
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CABKMkP+m5xNYv5aDL-YM=3DxbaOx+dnYEiZQbMm4wFmk=3DFTB+M1Q@mail.=
gmail.com">
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DU=
TF-8">
      <div dir=3D"ltr">
        <div>I'm putting together a recipe that requires two passes,
          native, then target.=C2=A0 I'm hitting a python error only in t=
he
          native pass.=C2=A0 I can cross compile the tool without error, =
so
          the problem is =C2=A0isolated to native.=C2=A0 Any ideas?<br>
        </div>
        <div><br>
        </div>
        <div>Recipe is progress:</div>
        <div><a
href=3D"https://github.com/meta-flutter/meta-flutter/blob/jw/membrane/rec=
ipes-devtools/membrane/membrane-example_git.bb"
            moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">http=
s://github.com/meta-flutter/meta-flutter/blob/jw/membrane/recipes-devtool=
s/membrane/membrane-example_git.bb</a><br>
        </div>
        <div><br>
        </div>
        <div>Thanks,</div>
        <div>Joel</div>
        <div>
          <div><br>
          </div>
          <div>
            <div
style=3D"box-sizing:border-box;color:rgb(201,209,217);font-family:ui-mono=
space,SFMono-Regular,&quot;SF
              Mono&quot;,Menlo,Consolas,&quot;Liberation
              Mono&quot;,monospace;font-size:12px">
              <div class=3D"gmail-js-check-step-line gmail-CheckStep-line=

                gmail-d-flex gmail-log-line-plain"
                style=3D"box-sizing:border-box;line-height:20px;display:f=
lex"><span class=3D"gmail-CheckStep-line-content gmail-d-inline-block gma=
il-flex-auto gmail-ml-3 gmail-js-check-line-content" style=3D"box-sizing:=
border-box;overflow-x:auto;white-space:pre-wrap;margin-left:16px;display:=
inline-block"><span class=3D"gmail-" style=3D"box-sizing:border-box">| er=
ror: linking with `/__w/meta-flutter/yocto-kirkstone/build/tmp/work/x86_6=
4-linux/membrane-example-native/git.AUTOINC+4e788100fc-r0/wrapper/target-=
<span class=3D"gmail-dt-fm" style=3D"box-sizing:border-box;padding-top:2p=
x;padding-bottom:1px;border-radius:2px">rust</span>-ccld` failed: exit st=
atus: 1
</span></span></div>
            </div>
            <div
style=3D"box-sizing:border-box;color:rgb(201,209,217);font-family:ui-mono=
space,SFMono-Regular,&quot;SF
              Mono&quot;,Menlo,Consolas,&quot;Liberation
              Mono&quot;,monospace;font-size:12px">
              <div class=3D"gmail-js-check-step-line gmail-CheckStep-line=

                gmail-d-flex gmail-log-line-plain"
                style=3D"box-sizing:border-box;line-height:20px;display:f=
lex"><a
                  class=3D"gmail-CheckStep-line-number
                  gmail-d-inline-block gmail-text-mono gmail-text-normal
                  gmail-flex-shrink-0"
href=3D"https://github.com/meta-flutter/meta-flutter/runs/8288580694?chec=
k_suite_focus=3Dtrue#step:9:529"
style=3D"box-sizing:border-box;text-decoration:none;width:48px;overflow:h=
idden;text-align:right;text-overflow:ellipsis;white-space:nowrap;display:=
inline-block"
                  moz-do-not-send=3D"true">528</a><span class=3D"gmail-Ch=
eckStep-line-content gmail-d-inline-block gmail-flex-auto gmail-ml-3 gmai=
l-js-check-line-content" style=3D"box-sizing:border-box;overflow-x:auto;w=
hite-space:pre-wrap;margin-left:16px;display:inline-block"><span class=3D=
"gmail-" style=3D"box-sizing:border-box">|   |
</span></span></div>
            </div>
            <div
style=3D"box-sizing:border-box;color:rgb(201,209,217);font-family:ui-mono=
space,SFMono-Regular,&quot;SF
              Mono&quot;,Menlo,Consolas,&quot;Liberation
              Mono&quot;,monospace;font-size:12px">
              <div class=3D"gmail-js-check-step-line gmail-CheckStep-line=

                gmail-d-flex gmail-log-line-plain"
                style=3D"box-sizing:border-box;line-height:20px;display:f=
lex"><a
                  class=3D"gmail-CheckStep-line-number
                  gmail-d-inline-block gmail-text-mono gmail-text-normal
                  gmail-flex-shrink-0"
href=3D"https://github.com/meta-flutter/meta-flutter/runs/8288580694?chec=
k_suite_focus=3Dtrue#step:9:530"
style=3D"box-sizing:border-box;text-decoration:none;width:48px;overflow:h=
idden;text-align:right;text-overflow:ellipsis;white-space:nowrap;display:=
inline-block"
                  moz-do-not-send=3D"true">529</a><span class=3D"gmail-Ch=
eckStep-line-content gmail-d-inline-block gmail-flex-auto gmail-ml-3 gmai=
l-js-check-line-content" style=3D"box-sizing:border-box;overflow-x:auto;w=
hite-space:pre-wrap;margin-left:16px;display:inline-block"><span class=3D=
"gmail-" style=3D"box-sizing:border-box">|   =3D note: "/__w/meta-flutter=
/yocto-kirkstone/build/tmp/work/x86_64-linux/membrane-example-native/git.=
AUTOINC+4e788100fc-r0/wrapper/target-<span class=3D"gmail-dt-fm" style=3D=
"box-sizing:border-box;padding-top:2px;padding-bottom:1px;border-radius:2=
px">rust</span>-ccld" "/__w/meta-flutter/yocto-kirkstone/build/tmp/work/x=
86_64-linux/membrane-example-native/git.AUTOINC+4e788100fc-r0/build/targe=
t/debug/build/parking_lot_core-e7575e9f22c0f65d/build_script_build-e7575e=
9f22c0f65d.build_script_build.c34fd75e-cgu.0.rcgu.o" "/__w/meta-flutter/y=
octo-kirkstone/build/tmp/work/x86_64-linux/membrane-example-native/git.AU=
TOINC+4e788100fc-r0/build/target/debug/build/parking_lot_core-e7575e9f22c=
0f65d/build_script_build-e7575e9f22c0f65d.build_script_build.c34fd75e-cgu=
=2E1.rcgu.o" "/__w/meta-flutter/yocto-kirkstone/build/tmp/work/x86_64-lin=
ux/membrane-example-native/git.AUTOINC+4e788100fc-r0/build/target/debug/b=
uild/parking_lot_core-e7575e9f22c0f65d/build_script_build-e7575e9f22c0f65=
d.build_script_build.c34fd75e-cgu.10.rcgu.o" "/__w/meta-flutter/yocto-kir=
kstone/build/tmp/work/x86_64-linux/membrane-example-native/git.AUTOINC+4e=
788100fc-r0/build/tar...
</span></span></div>
            </div>
            <div
style=3D"box-sizing:border-box;color:rgb(201,209,217);font-family:ui-mono=
space,SFMono-Regular,&quot;SF
              Mono&quot;,Menlo,Consolas,&quot;Liberation
              Mono&quot;,monospace;font-size:12px">
              <div class=3D"gmail-js-check-step-line gmail-CheckStep-line=

                gmail-d-flex gmail-log-line-plain"
                style=3D"box-sizing:border-box;line-height:20px;display:f=
lex"><a
                  class=3D"gmail-CheckStep-line-number
                  gmail-d-inline-block gmail-text-mono gmail-text-normal
                  gmail-flex-shrink-0"
href=3D"https://github.com/meta-flutter/meta-flutter/runs/8288580694?chec=
k_suite_focus=3Dtrue#step:9:531"
style=3D"box-sizing:border-box;text-decoration:none;width:48px;overflow:h=
idden;text-align:right;text-overflow:ellipsis;white-space:nowrap;display:=
inline-block"
                  moz-do-not-send=3D"true">530</a><span class=3D"gmail-Ch=
eckStep-line-content gmail-d-inline-block gmail-flex-auto gmail-ml-3 gmai=
l-js-check-line-content" style=3D"box-sizing:border-box;overflow-x:auto;w=
hite-space:pre-wrap;margin-left:16px;display:inline-block"><span class=3D=
"gmail-" style=3D"box-sizing:border-box">|   =3D note: Traceback (most re=
cent call last):
</span></span></div>
            </div>
            <div
style=3D"box-sizing:border-box;color:rgb(201,209,217);font-family:ui-mono=
space,SFMono-Regular,&quot;SF
              Mono&quot;,Menlo,Consolas,&quot;Liberation
              Mono&quot;,monospace;font-size:12px">
              <div class=3D"gmail-js-check-step-line gmail-CheckStep-line=

                gmail-d-flex gmail-log-line-plain"
                style=3D"box-sizing:border-box;line-height:20px;display:f=
lex"><a
                  class=3D"gmail-CheckStep-line-number
                  gmail-d-inline-block gmail-text-mono gmail-text-normal
                  gmail-flex-shrink-0"
href=3D"https://github.com/meta-flutter/meta-flutter/runs/8288580694?chec=
k_suite_focus=3Dtrue#step:9:532"
style=3D"box-sizing:border-box;text-decoration:none;width:48px;overflow:h=
idden;text-align:right;text-overflow:ellipsis;white-space:nowrap;display:=
inline-block"
                  moz-do-not-send=3D"true">531</a><span class=3D"gmail-Ch=
eckStep-line-content gmail-d-inline-block gmail-flex-auto gmail-ml-3 gmai=
l-js-check-line-content" style=3D"box-sizing:border-box;overflow-x:auto;w=
hite-space:pre-wrap;margin-left:16px;display:inline-block"><span class=3D=
"gmail-" style=3D"box-sizing:border-box">|             File "/__w/meta-fl=
utter/yocto-kirkstone/build/tmp/work/x86_64-linux/membrane-example-native=
/git.AUTOINC+4e788100fc-r0/wrapper/target-<span class=3D"gmail-dt-fm" sty=
le=3D"box-sizing:border-box;padding-top:2px;padding-bottom:1px;border-rad=
ius:2px">rust</span>-ccld", line 6, in &lt;module&gt;
</span></span></div>
            </div>
            <div
style=3D"box-sizing:border-box;color:rgb(201,209,217);font-family:ui-mono=
space,SFMono-Regular,&quot;SF
              Mono&quot;,Menlo,Consolas,&quot;Liberation
              Mono&quot;,monospace;font-size:12px">
              <div class=3D"gmail-js-check-step-line gmail-CheckStep-line=

                gmail-d-flex gmail-log-line-plain"
                style=3D"box-sizing:border-box;line-height:20px;display:f=
lex"><a
                  class=3D"gmail-CheckStep-line-number
                  gmail-d-inline-block gmail-text-mono gmail-text-normal
                  gmail-flex-shrink-0"
href=3D"https://github.com/meta-flutter/meta-flutter/runs/8288580694?chec=
k_suite_focus=3Dtrue#step:9:533"
style=3D"box-sizing:border-box;text-decoration:none;width:48px;overflow:h=
idden;text-align:right;text-overflow:ellipsis;white-space:nowrap;display:=
inline-block"
                  moz-do-not-send=3D"true">532</a><span class=3D"gmail-Ch=
eckStep-line-content gmail-d-inline-block gmail-flex-auto gmail-ml-3 gmai=
l-js-check-line-content" style=3D"box-sizing:border-box;overflow-x:auto;w=
hite-space:pre-wrap;margin-left:16px;display:inline-block"><span class=3D=
"gmail-" style=3D"box-sizing:border-box">|               os.execvp(binary=
, args)
</span></span></div>
            </div>
            <div
style=3D"box-sizing:border-box;color:rgb(201,209,217);font-family:ui-mono=
space,SFMono-Regular,&quot;SF
              Mono&quot;,Menlo,Consolas,&quot;Liberation
              Mono&quot;,monospace;font-size:12px">
              <div class=3D"gmail-js-check-step-line gmail-CheckStep-line=

                gmail-d-flex gmail-log-line-plain"
                style=3D"box-sizing:border-box;line-height:20px;display:f=
lex"><a
                  class=3D"gmail-CheckStep-line-number
                  gmail-d-inline-block gmail-text-mono gmail-text-normal
                  gmail-flex-shrink-0"
href=3D"https://github.com/meta-flutter/meta-flutter/runs/8288580694?chec=
k_suite_focus=3Dtrue#step:9:534"
style=3D"box-sizing:border-box;text-decoration:none;width:48px;overflow:h=
idden;text-align:right;text-overflow:ellipsis;white-space:nowrap;display:=
inline-block"
                  moz-do-not-send=3D"true">533</a><span class=3D"gmail-Ch=
eckStep-line-content gmail-d-inline-block gmail-flex-auto gmail-ml-3 gmai=
l-js-check-line-content" style=3D"box-sizing:border-box;overflow-x:auto;w=
hite-space:pre-wrap;margin-left:16px;display:inline-block"><span class=3D=
"gmail-" style=3D"box-sizing:border-box">|             File "/__w/meta-fl=
utter/yocto-kirkstone/build/tmp/work/x86_64-linux/membrane-example-native=
/git.AUTOINC+4e788100fc-r0/recipe-sysroot-native/usr/lib/python3.10/os.py=
", line 574, in execvp
</span></span></div>
            </div>
            <div
style=3D"box-sizing:border-box;color:rgb(201,209,217);font-family:ui-mono=
space,SFMono-Regular,&quot;SF
              Mono&quot;,Menlo,Consolas,&quot;Liberation
              Mono&quot;,monospace;font-size:12px">
              <div class=3D"gmail-js-check-step-line gmail-CheckStep-line=

                gmail-d-flex gmail-log-line-plain"
                style=3D"box-sizing:border-box;line-height:20px;display:f=
lex"><a
                  class=3D"gmail-CheckStep-line-number
                  gmail-d-inline-block gmail-text-mono gmail-text-normal
                  gmail-flex-shrink-0"
href=3D"https://github.com/meta-flutter/meta-flutter/runs/8288580694?chec=
k_suite_focus=3Dtrue#step:9:535"
style=3D"box-sizing:border-box;text-decoration:none;width:48px;overflow:h=
idden;text-align:right;text-overflow:ellipsis;white-space:nowrap;display:=
inline-block"
                  moz-do-not-send=3D"true">534</a><span class=3D"gmail-Ch=
eckStep-line-content gmail-d-inline-block gmail-flex-auto gmail-ml-3 gmai=
l-js-check-line-content" style=3D"box-sizing:border-box;overflow-x:auto;w=
hite-space:pre-wrap;margin-left:16px;display:inline-block"><span class=3D=
"gmail-" style=3D"box-sizing:border-box">|               _execvpe(file, a=
rgs)
</span></span></div>
            </div>
            <div
style=3D"box-sizing:border-box;color:rgb(201,209,217);font-family:ui-mono=
space,SFMono-Regular,&quot;SF
              Mono&quot;,Menlo,Consolas,&quot;Liberation
              Mono&quot;,monospace;font-size:12px">
              <div class=3D"gmail-js-check-step-line gmail-CheckStep-line=

                gmail-d-flex gmail-log-line-plain"
                style=3D"box-sizing:border-box;line-height:20px;display:f=
lex"><a
                  class=3D"gmail-CheckStep-line-number
                  gmail-d-inline-block gmail-text-mono gmail-text-normal
                  gmail-flex-shrink-0"
href=3D"https://github.com/meta-flutter/meta-flutter/runs/8288580694?chec=
k_suite_focus=3Dtrue#step:9:536"
style=3D"box-sizing:border-box;text-decoration:none;width:48px;overflow:h=
idden;text-align:right;text-overflow:ellipsis;white-space:nowrap;display:=
inline-block"
                  moz-do-not-send=3D"true">535</a><span class=3D"gmail-Ch=
eckStep-line-content gmail-d-inline-block gmail-flex-auto gmail-ml-3 gmai=
l-js-check-line-content" style=3D"box-sizing:border-box;overflow-x:auto;w=
hite-space:pre-wrap;margin-left:16px;display:inline-block"><span class=3D=
"gmail-" style=3D"box-sizing:border-box">|             File "/__w/meta-fl=
utter/yocto-kirkstone/build/tmp/work/x86_64-linux/membrane-example-native=
/git.AUTOINC+4e788100fc-r0/recipe-sysroot-native/usr/lib/python3.10/os.py=
", line 616, in _execvpe
</span></span></div>
            </div>
            <div
style=3D"box-sizing:border-box;color:rgb(201,209,217);font-family:ui-mono=
space,SFMono-Regular,&quot;SF
              Mono&quot;,Menlo,Consolas,&quot;Liberation
              Mono&quot;,monospace;font-size:12px">
              <div class=3D"gmail-js-check-step-line gmail-CheckStep-line=

                gmail-d-flex gmail-log-line-plain"
                style=3D"box-sizing:border-box;line-height:20px;display:f=
lex"><a
                  class=3D"gmail-CheckStep-line-number
                  gmail-d-inline-block gmail-text-mono gmail-text-normal
                  gmail-flex-shrink-0"
href=3D"https://github.com/meta-flutter/meta-flutter/runs/8288580694?chec=
k_suite_focus=3Dtrue#step:9:537"
style=3D"box-sizing:border-box;text-decoration:none;width:48px;overflow:h=
idden;text-align:right;text-overflow:ellipsis;white-space:nowrap;display:=
inline-block"
                  moz-do-not-send=3D"true">536</a><span class=3D"gmail-Ch=
eckStep-line-content gmail-d-inline-block gmail-flex-auto gmail-ml-3 gmai=
l-js-check-line-content" style=3D"box-sizing:border-box;overflow-x:auto;w=
hite-space:pre-wrap;margin-left:16px;display:inline-block"><span class=3D=
"gmail-" style=3D"box-sizing:border-box">|               raise last_exc
</span></span></div>
            </div>
            <div
style=3D"box-sizing:border-box;color:rgb(201,209,217);font-family:ui-mono=
space,SFMono-Regular,&quot;SF
              Mono&quot;,Menlo,Consolas,&quot;Liberation
              Mono&quot;,monospace;font-size:12px">
              <div class=3D"gmail-js-check-step-line gmail-CheckStep-line=

                gmail-d-flex gmail-log-line-plain"
                style=3D"box-sizing:border-box;line-height:20px;display:f=
lex"><a
                  class=3D"gmail-CheckStep-line-number
                  gmail-d-inline-block gmail-text-mono gmail-text-normal
                  gmail-flex-shrink-0"
href=3D"https://github.com/meta-flutter/meta-flutter/runs/8288580694?chec=
k_suite_focus=3Dtrue#step:9:538"
style=3D"box-sizing:border-box;text-decoration:none;width:48px;overflow:h=
idden;text-align:right;text-overflow:ellipsis;white-space:nowrap;display:=
inline-block"
                  moz-do-not-send=3D"true">537</a><span class=3D"gmail-Ch=
eckStep-line-content gmail-d-inline-block gmail-flex-auto gmail-ml-3 gmai=
l-js-check-line-content" style=3D"box-sizing:border-box;overflow-x:auto;w=
hite-space:pre-wrap;margin-left:16px;display:inline-block"><span class=3D=
"gmail-" style=3D"box-sizing:border-box">|             File "/__w/meta-fl=
utter/yocto-kirkstone/build/tmp/work/x86_64-linux/membrane-example-native=
/git.AUTOINC+4e788100fc-r0/recipe-sysroot-native/usr/lib/python3.10/os.py=
", line 607, in _execvpe
</span></span></div>
            </div>
            <div
style=3D"box-sizing:border-box;color:rgb(201,209,217);font-family:ui-mono=
space,SFMono-Regular,&quot;SF
              Mono&quot;,Menlo,Consolas,&quot;Liberation
              Mono&quot;,monospace;font-size:12px">
              <div class=3D"gmail-js-check-step-line gmail-CheckStep-line=

                gmail-d-flex gmail-log-line-plain"
                style=3D"box-sizing:border-box;line-height:20px;display:f=
lex"><a
                  class=3D"gmail-CheckStep-line-number
                  gmail-d-inline-block gmail-text-mono gmail-text-normal
                  gmail-flex-shrink-0"
href=3D"https://github.com/meta-flutter/meta-flutter/runs/8288580694?chec=
k_suite_focus=3Dtrue#step:9:539"
style=3D"box-sizing:border-box;text-decoration:none;width:48px;overflow:h=
idden;text-align:right;text-overflow:ellipsis;white-space:nowrap;display:=
inline-block"
                  moz-do-not-send=3D"true">538</a><span class=3D"gmail-Ch=
eckStep-line-content gmail-d-inline-block gmail-flex-auto gmail-ml-3 gmai=
l-js-check-line-content" style=3D"box-sizing:border-box;overflow-x:auto;w=
hite-space:pre-wrap;margin-left:16px;display:inline-block"><span class=3D=
"gmail-" style=3D"box-sizing:border-box">|               exec_func(fullna=
me, *argrest)
</span></span></div>
            </div>
            <div
style=3D"box-sizing:border-box;color:rgb(201,209,217);font-family:ui-mono=
space,SFMono-Regular,&quot;SF
              Mono&quot;,Menlo,Consolas,&quot;Liberation
              Mono&quot;,monospace;font-size:12px">
              <div class=3D"gmail-js-check-step-line gmail-CheckStep-line=

                gmail-d-flex gmail-log-line-plain"
                style=3D"box-sizing:border-box;line-height:20px;display:f=
lex"><a
                  class=3D"gmail-CheckStep-line-number
                  gmail-d-inline-block gmail-text-mono gmail-text-normal
                  gmail-flex-shrink-0"
href=3D"https://github.com/meta-flutter/meta-flutter/runs/8288580694?chec=
k_suite_focus=3Dtrue#step:9:540"
style=3D"box-sizing:border-box;text-decoration:none;width:48px;overflow:h=
idden;text-align:right;text-overflow:ellipsis;white-space:nowrap;display:=
inline-block"
                  moz-do-not-send=3D"true">539</a><span class=3D"gmail-Ch=
eckStep-line-content gmail-d-inline-block gmail-flex-auto gmail-ml-3 gmai=
l-js-check-line-content" style=3D"box-sizing:border-box;overflow-x:auto;w=
hite-space:pre-wrap;margin-left:16px;display:inline-block"><span class=3D=
"gmail-" style=3D"box-sizing:border-box">|           FileNotFoundError: [=
Errno 2] No such file or directory</span></span></div>
            </div>
            <div><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>Just looking at the last line and the error it looks similar to
      what I hunted for in this thread.
      <a class=3D"moz-txt-link-freetext" href=3D"https://lists.openembedd=
ed.org/g/openembedded-core/topic/93200332#169698">https://lists.openembed=
ded.org/g/openembedded-core/topic/93200332#169698</a>
      Could probably be something similar. In that case the build used
      wrong interpreter. I hope it can help you somewhere.<br>
    </p>
    <p>/Peter<br>
    </p>
    <br>
  </body>
</html>

--------------2PaokyQymQD0IATN05Pyp0c6--
