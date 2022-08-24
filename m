X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <2d509d46-6194-aac0-841c-bbd2e61f4501@berginkonsult.se>
Date: Wed, 24 Aug 2022 08:16:55 +0200
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH] rust-cross-canadian: rename shell variables for easier appends
References: <20220823110227.68348-1-peter@berginkonsult.se>
 <CAP9ODKoRj+aqcdH6uFN0xZEeMJ2y=8e931vGTFFxgQsXh=pO6Q@mail.gmail.com>
 <3a0627d1-c3c5-aad6-cd3e-a6dc6e310f07@berginkonsult.se>
 <CAP9ODKqtMiNRs76aVqNuRQWr7xhCP-t=AR-f+civ-+G409ak_g@mail.gmail.com>
From: "Peter Bergin" <peter@berginkonsult.se>
In-Reply-To: <CAP9ODKqtMiNRs76aVqNuRQWr7xhCP-t=AR-f+civ-+G409ak_g@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------Dtr7WW971VrainFF0TBA517z"
Content-Language: en-US
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

--------------Dtr7WW971VrainFF0TBA517z
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

On 2022-08-23 23:32, Otavio Salvador wrote:
>
>
> Em ter., 23 de ago. de 2022 às 17:38, Peter Bergin 
> <peter@berginkonsult.se> escreveu:
>
>     In my particular case the rust application I'm building against
>     the SDK is using the crate prost-build
>     (https://crates.io/crates/prost-build) that is used to generate
>     code from .proto files. It is using the tool protoc from protobuf
>     and in order to get it working the variable PROTOC needs to be
>     set. Then my solution was to add that variable to
>     environment-setup.d/rust.sh in the SDK as I thought that was an
>     easy solution and rust.sh is in some way connected to the variable
>     setting. Then looking in to do_install of rust-cross-canadian I
>     saw that the variable ENV_SETUP_SH is first used for rust.sh then
>     for cargo.sh so I could not use it to point out rust.sh. Then I
>     had the idea that it would be better to have one variable for
>     rust.sh and one for cargo.sh.
>
> The protoc could have this set in environment-setup.d so it doesn't 
> need change in rust and avoids rebuilds.
>
Yes. As I wrote there are many different solutions to my problem. In 
this patch I just wanted to share in what I think an improvement for a 
recipe.

/Peter


--------------Dtr7WW971VrainFF0TBA517z
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2022-08-23 23:32, Otavio Salvador
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAP9ODKqtMiNRs76aVqNuRQWr7xhCP-t=AR-f+civ-+G409ak_g@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr"><br>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">Em ter., 23 de ago. de 2022
            às 17:38, Peter Bergin &lt;<a
              href="mailto:peter@berginkonsult.se"
              moz-do-not-send="true" class="moz-txt-link-freetext">peter@berginkonsult.se</a>&gt;
            escreveu:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div>
              <p>In my particular case the rust application I'm building
                against the SDK is using the crate prost-build (<a
                  href="https://crates.io/crates/prost-build"
                  target="_blank" moz-do-not-send="true"
                  class="moz-txt-link-freetext">https://crates.io/crates/prost-build</a>)
                that is used to generate code from .proto files. It is
                using the tool protoc from protobuf and in order to get
                it working the variable PROTOC needs to be set. Then my
                solution was to add that variable to
                environment-setup.d/rust.sh in the SDK as I thought that
                was an easy solution and rust.sh is in some way
                connected to the variable setting. Then looking in to
                do_install of rust-cross-canadian I saw that the
                variable ENV_SETUP_SH is first used for rust.sh then for
                cargo.sh so I could not use it to point out rust.sh.
                Then I had the idea that it would be better to have one
                variable for rust.sh and one for cargo.sh.<br>
              </p>
            </div>
          </blockquote>
          <div>The protoc could have this set in environment-setup.d so
            it doesn't need change in rust and avoids rebuilds.</div>
        </div>
        <div><br>
        </div>
      </div>
    </blockquote>
    <p>Yes. As I wrote there are many different solutions to my problem.
      In this patch I just wanted to share in what I think an
      improvement for a recipe.</p>
    <p>/Peter<br>
    </p>
    <br>
  </body>
</html>

--------------Dtr7WW971VrainFF0TBA517z--
