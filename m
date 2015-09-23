Return-Path: <marcus.mueller@ettus.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0E5E676E04
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 09:06:09 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so197454630wic.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 02:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type;
	bh=1iGBPE9DphedRlsS1+JxnsSWoTWCMbsk4A3FtJH1heE=;
	b=eSzrs6EofnMhgzVLGiuJONIkOJ242klThH8MByZwtsQT6Er8W+mBl0inkFbIoomgux
	/kVVL6gIacYtjpvIQqv2i4j9300I9vC0poTM90VTjsL7SYy96OWmbMw9POZn3wIfDfCr
	7HVFGKZu0quKya8FThKFOyOU0Vtuwp/Q7MUR2DvyL3tFhuOZO7OfbKJbeVL7JuuDBvUz
	9BXyOZAVhmGkE0MHkbNbEgBrVcK/X6tRm/bhb0i0dro1q74Io8U7vcfYKkoGk0+vdT8W
	vdsUHDw6yYrBDXc0jfPRUTV3FXWnTvrfysXtpxEuA+QBA93dlWoXV1uqntwl7WYU53tf
	8+Kg==
X-Gm-Message-State: ALoCoQldSG7HO4SfODFjNwLhzg+zWuSW0S6jgEHxkObQkTiP188P2pSgKC1iUY10ooq0RczRb5Nq
X-Received: by 10.180.107.195 with SMTP id he3mr2835147wib.35.1442999169748;
	Wed, 23 Sep 2015 02:06:09 -0700 (PDT)
Received: from [192.168.128.8] (x5f71d3b0.dyn.telefonica.de. [95.113.211.176])
	by smtp.googlemail.com with ESMTPSA id
	h8sm7448331wib.21.2015.09.23.02.06.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Sep 2015 02:06:09 -0700 (PDT)
To: Lee Nipper <lee.nipper@linux.com>
References: <1442943875-2955-1-git-send-email-marcus.mueller@ettus.com>
	<CALg11mgdLnVNq745Z6vzP5R2t=dcpamHTKkg5ptv5+NXWFxXpQ@mail.gmail.com>
	<5601A1C6.5050205@ettus.com>
	<CALg11mhL1YMX_1aW8FUQoT5qJEgESe3SSQvk+40gukiA2Ffidg@mail.gmail.com>
From: =?UTF-8?Q?Marcus_M=c3=bcller?= <marcus.mueller@ettus.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <56026B80.2020909@ettus.com>
Date: Wed, 23 Sep 2015 11:06:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CALg11mhL1YMX_1aW8FUQoT5qJEgESe3SSQvk+40gukiA2Ffidg@mail.gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] hand the TEMPLATECONF local over to setup-builddir
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
X-List-Received-Date: Wed, 23 Sep 2015 09:06:17 -0000
Content-Type: multipart/alternative;
	boundary="------------030808030804070501030306"

--------------030808030804070501030306
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hello Lee,

wow, thanks for clearing testing this; actually, to trigger my personal
need for a patch, variant # A was used.

Cheers,
Marcus

On 22.09.2015 22:25, Lee Nipper wrote:
> On Tue, Sep 22, 2015 at 1:45 PM, Marcus Müller
> <marcus.mueller@ettus.com <mailto:marcus.mueller@ettus.com>> wrote:
>
>     Hello,
>     > If I understand correctly it allows a user prepared $TEMPLATECONF
>     > directory
>     > to be used by oe-setup-builddir.
>     Indeed; the point is that oe-setup-builddir was definitely meant to be
>     used with a TEMPLATECONF set by the user; in bash, the TEMPLATECONF
>     local variable is automatically passed on from oe-init-build-env to
>     oe-setup-builddir¹, but in zsh, this doesn't work without explicitely
>     declaring that should happen (which is the only thing my patch does).
>
>     Best regards,
>     Marcus
>
>     ¹ not quite sure how; it's a local to the calling script and shouldn't
>     be a local or env variable to the callee, IMHO.
>
>
>
> Hello Marcus,
>
> FWIW, I did some test cases to understand the differences.
>
> With bash 4.3.11, and the examples below,
> cases A and B will pass along TEMPLATECONF, but case C does not.
> Your patch makes case C work as well.
>
> # A:
>
> TEMPLATECONF=$HOME/my-template-dir source
> ~/openembedded-core/oe-init-build-env $HOME/my-build-dir
>
> # B:
> export TEMPLATECONF=$HOME/my-template-dir; source
> ~/openembedded-core/oe-init-build-env $HOME/my-build-dir
>
> # C:
> TEMPLATECONF=$HOME/my-template-dir; source
> ~/openembedded-core/oe-init-build-env $HOME/my-build-dir
>
>
> And with zsh 5.0.2, case B will pass along TEMPLATECONF, but cases A
> and C do not.
> Your patch makes cases A and C work as well with zsh.
>
> I did not expect case A to be different than case C for bash, but it
> apparently works differently than I thought.
>
> Best regards,
> Lee
>


--------------030808030804070501030306
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Hello Lee,<br>
    <br>
    wow, thanks for clearing testing this; actually, to trigger my
    personal need for a patch, variant # A was used.<br>
    <br>
    Cheers,<br>
    Marcus<br>
    <br>
    <div class="moz-cite-prefix">On 22.09.2015 22:25, Lee Nipper wrote:<br>
    </div>
    <blockquote
cite="mid:CALg11mhL1YMX_1aW8FUQoT5qJEgESe3SSQvk+40gukiA2Ffidg@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">On Tue, Sep 22, 2015 at 1:45 PM,
            Marcus Müller <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:marcus.mueller@ettus.com" target="_blank">marcus.mueller@ettus.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">Hello,<br>
              <span class="">&gt; If I understand correctly it allows a
                user prepared $TEMPLATECONF<br>
                &gt; directory<br>
                &gt; to be used by oe-setup-builddir.<br>
              </span>Indeed; the point is that oe-setup-builddir was
              definitely meant to be<br>
              used with a TEMPLATECONF set by the user; in bash, the
              TEMPLATECONF<br>
              local variable is automatically passed on from
              oe-init-build-env to<br>
              oe-setup-builddir¹, but in zsh, this doesn't work without
              explicitely<br>
              declaring that should happen (which is the only thing my
              patch does).<br>
              <br>
              Best regards,<br>
              Marcus<br>
              <br>
              ¹ not quite sure how; it's a local to the calling script
              and shouldn't<br>
              be a local or env variable to the callee, IMHO.<br>
            </blockquote>
            <div><br>
            </div>
            <div><br>
            </div>
            <div>Hello Marcus,</div>
            <div><br>
            </div>
            <div>FWIW, I did some test cases to understand the
              differences.</div>
            <div><br>
            </div>
            <div>With bash 4.3.11, and the examples below,</div>
            <div>cases A and B will pass along TEMPLATECONF, but case C
              does not.</div>
            <div>Your patch makes case C work as well.</div>
            <div><br>
            </div>
            <div># A:</div>
            <div><br>
            </div>
            <div>TEMPLATECONF=$HOME/my-template-dir source
              ~/openembedded-core/oe-init-build-env $HOME/my-build-dir</div>
            <div><br>
            </div>
            <div># B:</div>
            <div>export TEMPLATECONF=$HOME/my-template-dir; source
              ~/openembedded-core/oe-init-build-env $HOME/my-build-dir</div>
            <div><br>
            </div>
            <div># C:</div>
            <div>TEMPLATECONF=$HOME/my-template-dir; source
              ~/openembedded-core/oe-init-build-env $HOME/my-build-dir</div>
            <div><br>
            </div>
            <div><br>
            </div>
            <div>And with zsh 5.0.2, case B will pass along
              TEMPLATECONF, but cases A and C do not.</div>
            <div>Your patch makes cases A and C work as well with zsh.</div>
            <div><br>
            </div>
            <div>I did not expect case A to be different than case C for
              bash, but it apparently works differently than I thought.</div>
            <div><br>
            </div>
            <div>Best regards,</div>
            <div>Lee</div>
          </div>
          <br>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------030808030804070501030306--
