Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3A1E66D1DE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 18:45:01 +0000 (UTC)
Received: by mail-ie0-f177.google.com with SMTP id tp5so2455273ieb.36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2014 10:45:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=RfcOsoTodgoCbMF6ck/9/vL8KWi4IqWsH4uz4DJmrhs=;
	b=VtYG0Am+M7AKMIh2yK2nvvzQZATXgw7pE0cT/AHoDCy0KpGI+Qb3485i66t9mjhETs
	4AZ5tW/9O02Lubzevz+9pdKHKDCFAGtwL1SuuDbwGR/oTW2+LwHszIzN2ihB5Qa4MHhT
	AK+Dz4xXDnCD0RUWMd16XIYAl8mIvwa7zFXL7jChg8p8+oGJ94JbqpmjDi/uKPCt1AU2
	N7bJZ1nIT14xed+paPZNECOBr8a27xdzen8tO2kWVSCpmmLvJm4TCmqp9rkaKHwIJU6U
	H+DHP2URiyk92jCIkWYy+lZ00TIy1Ola1MkUgAgoomE8eiecctbIqGVyrHM0Tjtmi/pf
	vG2A==
X-Gm-Message-State: ALoCoQnj1ac2CNKwxjQx+0PX866ZpFc2bv7ZlZXVQMBizQtpAIILdQ/geU8UPTZyZZCJA4p/KdY0
X-Received: by 10.42.121.147 with SMTP id j19mr62221786icr.13.1389206701566;
	Wed, 08 Jan 2014 10:45:01 -0800 (PST)
Received: from [192.168.141.83] (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id ni7sm10040275igb.7.2014.01.08.10.45.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 08 Jan 2014 10:45:00 -0800 (PST)
Message-ID: <52CD9CAB.5020501@linaro.org>
Date: Wed, 08 Jan 2014 13:44:59 -0500
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <52CC470A.9030302@linaro.org> <1759035.6JVm74GdRW@helios>
In-Reply-To: <1759035.6JVm74GdRW@helios>
Subject: Re: Qt in OE-core
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
X-List-Received-Date: Wed, 08 Jan 2014 18:45:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 01/08/14 10:56, Paul Eggleton wrote:
> However, one concern I have always had with Qt being moved out of
> OE-Core though is that I very much doubt the same will happen with
> GTK+ and GNOME UI components that we carry, which I think will lead to
> the (perhaps erroneous, but logical) assumption in new users' minds
> that we support or recommend these more than we do Qt. Given Qt's
> popularity in the embedded space I don't think this would be the right
> message to be sending out. Any concrete ideas on how we would address
> this perception issue? 

Would it be worthwhile to ask that the OE TSC take on the task of
defining what is "core" and what is not? Does this definition already exist?

From the moment OE chose to adopt a layered strategy, people started
questioning how to define a layer and what recipes should be part of one
layer versus another. But it doesn't seem as though there's been much
interest in setting any definite rules or definitions in this regard.
Maybe it would be worth the effort to at least try?

In my opinion...

Personally I would be in favour of removing GTK+ and the GNOME UI from
the core and putting them in their own layer for all the same reasons I
think Qt should be in its own layer:
- a "basic" image doesn't need them
- we can have different layers to track separate major releases (as with
qt3, qt4, and qt5)

There are so many ways to do GUI "things" on top of a Linux system.
Frankly I'm not even in a position where I could enumerate all of them,
or even sort them out:
- x11, wayland, mir, (directfb)
(http://en.wikipedia.org/wiki/Display_server)
- qt, gtk+, wxwidgets, tcl/tk, fltk
(http://en.wikipedia.org/wiki/List_of_widget_toolkits)
- xlib, xcb (client libraries implementing x11 protocol)
- weston, mutter, kwin, clayland (display servers implementing the
wayland display server protocol)
- opengl, opengles, egl, ...

(I can't even begin to figure out how to draw a diagram that shows how
all these projects fit together!)

Maybe if there are significant competing projects which do the same
thing, then they should be implemented in their own layer:
- meta-python
- meta-perl

And if there are completing projects which do the same thing but which
aren't significantly large projects on their own (e.g.
http://en.wikipedia.org/wiki/Comparison_of_lightweight_web_servers) then
they should form a layer together of their own:
- meta-apache-httpd
- meta-http-servers
  - boa
  - cherokee
  - lighttpd
  - nginx

Or maybe all projects which do the same thing different ways should be
in their own layer? That way we don't have to distinguish between
"significant" and "lightweight" projects"
- meta-scripting-languages
  - python
  - perl
  - ruby
- meta-http-servers
  - apache
  - boa
  - cherokee
  - lighttpd
  - nginx

And maybe "core" should be just enough to get a console-based image working?

