Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0D02F788E3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 07:36:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w2M7a76m004592
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 22 Mar 2018 00:36:08 -0700 (PDT)
Received: from [128.224.162.197] (128.224.162.197) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 22 Mar 2018 00:36:07 -0700
To: "Burton, Ross" <ross.burton@intel.com>, Khem Raj <raj.khem@gmail.com>
References: <cover.1520841539.git.Qi.Chen@windriver.com>
	<e0d90ab0b0aea86e2955dfa749fdad1add65e6ac.1520841539.git.Qi.Chen@windriver.com>
	<CAO5Uq5RBUztJ5uLdONZ0apJzCko_oXQ6L3D-9s-59Yvip9+BiQ@mail.gmail.com>
	<CAMKF1srb-oT6pXiE+1db8E9+4j=Rp+PURe5bdBUnVF3zMANnag@mail.gmail.com>
	<CAJTo0Lba_b2Hgd27movji5BQ5yqCrt5bqmXbwrJYuwth_oKKvA@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <24e50a62-5980-19d6-812b-d2eb4d408dca@windriver.com>
Date: Thu, 22 Mar 2018 15:36:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lba_b2Hgd27movji5BQ5yqCrt5bqmXbwrJYuwth_oKKvA@mail.gmail.com>
X-Originating-IP: [128.224.162.197]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] systemd: upgrade to 237
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
X-List-Received-Date: Thu, 22 Mar 2018 07:36:11 -0000
Content-Type: multipart/alternative;
	boundary="------------16BA872FA18C6A53AFD4B50A"

--------------16BA872FA18C6A53AFD4B50A
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/21/2018 02:00 AM, Burton, Ross wrote:
> On 20 March 2018 at 17:36, Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
>
>     >> @@ -80,7 +78,7 @@ PACKAGECONFIG ??= " \
>     >>      polkit \
>     >>      quotacheck \
>     >>      randomseed \
>     >> -    resolved \
>     >> +    resolve \
>     >
>     > I guess this was deliberate, but does it need picking up in release
>     > notes? Tripped up my builds off of master - clearly a trivial fix
>     > though.
>
>     hmm good catch but why change ?
>
>
> Bah, didn't notice this.
>
> Chen, can you submit a patch to change this back?
>
> Ross


Hi All,

I've sent out a patch to change 'resolve' back to 'resolved'.

Sorry for causing troubles for you.
I used 'resolve' because meson_options.txt uses the word 'resolve' 
instead of 'resolved'.
But I now know that backward compatibility is more important.

Best Regards,
Chen Qi

--------------16BA872FA18C6A53AFD4B50A
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 03/21/2018 02:00 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0Lba_b2Hgd27movji5BQ5yqCrt5bqmXbwrJYuwth_oKKvA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">On 20 March 2018 at 17:36, Khem Raj <span
          dir="ltr">&lt;<a moz-do-not-send="true"
            href="mailto:raj.khem@gmail.com" target="_blank">raj.khem@gmail.com</a>&gt;</span>
        wrote:<br>
        <div class="gmail_extra">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex"><span
                class="">&gt;&gt; @@ -80,7 +78,7 @@ PACKAGECONFIG ??= "
                \<br>
                &gt;&gt;      polkit \<br>
                &gt;&gt;      quotacheck \<br>
                &gt;&gt;      randomseed \<br>
                &gt;&gt; -    resolved \<br>
                &gt;&gt; +    resolve \<br>
                &gt;<br>
                &gt; I guess this was deliberate, but does it need
                picking up in release<br>
                &gt; notes? Tripped up my builds off of master - clearly
                a trivial fix<br>
                &gt; though.<br>
                <br>
              </span>hmm good catch but why change ?</blockquote>
            <div><br>
            </div>
            <div>Bah, didn't notice this.</div>
            <div><br>
            </div>
            <div>Chen, can you submit a patch to change this back?</div>
            <div><br>
            </div>
            <div>Ross</div>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    Hi All,<br>
    <br>
    I've sent out a patch to change 'resolve' back to 'resolved'.<br>
    <br>
    Sorry for causing troubles for you.<br>
    I used 'resolve' because meson_options.txt uses the word 'resolve'
    instead of 'resolved'.<br>
    But I now know that backward compatibility is more important.<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
  </body>
</html>

--------------16BA872FA18C6A53AFD4B50A--
