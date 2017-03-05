Return-Path: <contact@huau-gabriel.fr>
Received: from mail.huau-gabriel.fr (ks323487.kimsufi.com [37.187.0.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6BC1971A30
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Mar 2017 18:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.huau-gabriel.fr (Postfix) with ESMTP id 57C4C7FBAE;
	Sun,  5 Mar 2017 18:36:09 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at huau-gabriel.fr
Received: from mail.huau-gabriel.fr ([127.0.0.1])
	by localhost (mail.huau-gabriel.fr [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 4JatGBM28p82; Sun,  5 Mar 2017 18:36:07 +0000 (UTC)
Received: from [IPv6:2601:602:9800:45df:7259:6f64:2f69:ed89] (unknown
	[172.18.0.1]) (Authenticated sender: contact@huau-gabriel.fr)
	by mail.huau-gabriel.fr (Postfix) with ESMTPSA id 3CE827FB40;
	Sun,  5 Mar 2017 18:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=huau-gabriel.fr;
	s=mail; t=1488738967;
	bh=BC54cFJH8ed9ne3BPlYjVAf+tQPXYZDkATnXefMxCm4=;
	h=Subject:To:References:Cc:From:In-Reply-To;
	b=1OE3aWjr0C//ywFdroNSZcs8OmIYratEnkIfZo1jjrendvi29JIOF6Zx/xJpKoosb
	Qq1jPiaox2Xr52mKXEsQsOsYlknUiKYHGko2vju9z0f5ItT46uElxnl3g3nHg9xAPT
	lPrUMJtPkO5XzP733xwTeX+oeu+L4MgE2aTgCTBA=
To: "Burton, Ross" <ross.burton@intel.com>
References: <a94ef9bf-da82-b236-6911-7bfb595797d5@huau-gabriel.fr>
	<CAJTo0LZs7MyM0jRwcnkxjOM7Lbg8zXgOKinrpYcVapEb4RURgg@mail.gmail.com>
From: Gabriel Huau <contact@huau-gabriel.fr>
Message-ID: <15d293df-8055-f696-ee22-4489e249d490@huau-gabriel.fr>
Date: Sun, 5 Mar 2017 10:35:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZs7MyM0jRwcnkxjOM7Lbg8zXgOKinrpYcVapEb4RURgg@mail.gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: libglu: dependency on x11
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
X-List-Received-Date: Sun, 05 Mar 2017 18:35:31 -0000
Content-Type: multipart/alternative;
	boundary="------------C96ED54FADD0F9440561981D"

--------------C96ED54FADD0F9440561981D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Ross,

Good point!

I thought it was possible to have an implementation of libGL.so without 
X11, for example by using Wayland or any other Window System, I didn't 
know that the libGL was tied to X11 (on Linux). Also, I didn't see any 
specific X11 code in the libGLU so I was a bit confused by the 
dependency on both OpenGL and x11.

Regards,
Gabriel

On 03/05/2017 08:58 AM, Burton, Ross wrote:
>
> On 4 March 2017 at 22:52, Gabriel Huau <contact@huau-gabriel.fr 
> <mailto:contact@huau-gabriel.fr>> wrote:
>
>     I'm not sure to understand why do we have a dependency on X11 in
>     the libGLU package? I might miss some pieces of information here,
>     but IMO, it should only depends on opengl as the libGL.so could be
>     generated without X11 or any Window system.
>
>
> How does one build libGL.so without X11, considering libGL is 
> explicitly GLX, and the X in GLX stands for X Window System?
>
> Ross


--------------C96ED54FADD0F9440561981D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p>Ross,</p>
    <p>Good point!</p>
    <p>I thought it was possible to have an implementation of libGL.so
      without X11, for example by using Wayland or any other Window
      System, I didn't know that the libGL was tied to X11 (on Linux).
      Also, I didn't see any specific X11 code in the libGLU so I was a
      bit confused by the dependency on both OpenGL and x11.</p>
    <p>Regards,<br>
      Gabriel<br>
    </p>
    <div class="moz-cite-prefix">On 03/05/2017 08:58 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LZs7MyM0jRwcnkxjOM7Lbg8zXgOKinrpYcVapEb4RURgg@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 4 March 2017 at 22:52, Gabriel
            Huau <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:contact@huau-gabriel.fr" target="_blank">contact@huau-gabriel.fr</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":1t8" class="a3s aXjCH m15a9b8c775f12cf7">I'm not
                sure to understand why do we have a dependency on X11 in
                the libGLU package? I might miss some pieces of
                information here, but IMO, it should only depends on
                opengl as the libGL.so could be generated without X11 or
                any Window system.<br>
              </div>
            </blockquote>
          </div>
          <br>
          How does one build libGL.so without X11, considering libGL is
          explicitly GLX, and the X in GLX stands for X Window System?</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------C96ED54FADD0F9440561981D--
