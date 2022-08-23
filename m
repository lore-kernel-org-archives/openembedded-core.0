X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <3a0627d1-c3c5-aad6-cd3e-a6dc6e310f07@berginkonsult.se>
Date: Tue, 23 Aug 2022 22:38:00 +0200
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH] rust-cross-canadian: rename shell variables for easier appends
References: <20220823110227.68348-1-peter@berginkonsult.se>
 <CAP9ODKoRj+aqcdH6uFN0xZEeMJ2y=8e931vGTFFxgQsXh=pO6Q@mail.gmail.com>
From: "Peter Bergin" <peter@berginkonsult.se>
In-Reply-To: <CAP9ODKoRj+aqcdH6uFN0xZEeMJ2y=8e931vGTFFxgQsXh=pO6Q@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------owzos0UGDSyyjIcu0gHIZk4u"
Content-Language: en-US
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

--------------owzos0UGDSyyjIcu0gHIZk4u
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

Hi Otavio,

On 2022-08-23 16:03, Otavio Salvador wrote:
>
>
> Em ter., 23 de ago. de 2022 às 08:02, Peter Bergin 
> <peter@berginkonsult.se> escreveu:
>
>     Make unique shell variable names for cargo and rust
>     setup scripts. This change will make it easier to append to the
>     scripts in a bbappend file by using the variable for the script.
>     Before this change it was only possible for the last script as
>     they shared the same variable name.
>
>     Signed-off-by: Peter Bergin <peter@berginkonsult.se>
>
>
> Why do you want to append them?

In my particular case the rust application I'm building against the SDK 
is using the crate prost-build (https://crates.io/crates/prost-build) 
that is used to generate code from .proto files. It is using the tool 
protoc from protobuf and in order to get it working the variable PROTOC 
needs to be set. Then my solution was to add that variable to 
environment-setup.d/rust.sh in the SDK as I thought that was an easy 
solution and rust.sh is in some way connected to the variable setting. 
Then looking in to do_install of rust-cross-canadian I saw that the 
variable ENV_SETUP_SH is first used for rust.sh then for cargo.sh so I 
could not use it to point out rust.sh. Then I had the idea that it would 
be better to have one variable for rust.sh and one for cargo.sh.

No strong opinion if this is a good solution or not. I can find other 
solutions of course. If this break things for other people I hope it 
will not be accepted. Just wanted to share if it can also help others.

Best regards,
/Peter


--------------owzos0UGDSyyjIcu0gHIZk4u
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Otavio,<br>
    </p>
    <div class="moz-cite-prefix">On 2022-08-23 16:03, Otavio Salvador
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAP9ODKoRj+aqcdH6uFN0xZEeMJ2y=8e931vGTFFxgQsXh=pO6Q@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr"><br>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">Em ter., 23 de ago. de 2022
            às 08:02, Peter Bergin &lt;<a
              href="mailto:peter@berginkonsult.se"
              moz-do-not-send="true" class="moz-txt-link-freetext">peter@berginkonsult.se</a>&gt;
            escreveu:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">Make unique shell
            variable names for cargo and rust<br>
            setup scripts. This change will make it easier to append to
            the<br>
            scripts in a bbappend file by using the variable for the
            script.<br>
            Before this change it was only possible for the last script
            as<br>
            they shared the same variable name.<br>
            <br>
            Signed-off-by: Peter Bergin &lt;<a
              href="mailto:peter@berginkonsult.se" target="_blank"
              moz-do-not-send="true" class="moz-txt-link-freetext">peter@berginkonsult.se</a>&gt;<br>
          </blockquote>
          <div><br>
          </div>
          <div>Why do you want to append them?</div>
        </div>
      </div>
    </blockquote>
    <p>In my particular case the rust application I'm building against
      the SDK is using the crate prost-build
      (<a class="moz-txt-link-freetext" href="https://crates.io/crates/prost-build">https://crates.io/crates/prost-build</a>) that is used to generate
      code from .proto files. It is using the tool protoc from protobuf
      and in order to get it working the variable PROTOC needs to be
      set. Then my solution was to add that variable to
      environment-setup.d/rust.sh in the SDK as I thought that was an
      easy solution and rust.sh is in some way connected to the variable
      setting. Then looking in to do_install of rust-cross-canadian I
      saw that the variable ENV_SETUP_SH is first used for rust.sh then
      for cargo.sh so I could not use it to point out rust.sh. Then I
      had the idea that it would be better to have one variable for
      rust.sh and one for cargo.sh.</p>
    <p>No strong opinion if this is a good solution or not. I can find
      other solutions of course. If this break things for other people I
      hope it will not be accepted. Just wanted to share if it can also
      help others.</p>
    <p>Best regards,<br>
      /Peter<br>
    </p>
    <br>
  </body>
</html>

--------------owzos0UGDSyyjIcu0gHIZk4u--
