Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6E1E678A70
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 18:03:40 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id x1so5652648pfh.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 10:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=lK38IjC1sIQeGB2g/3BGEFgjg1+SXogCuKZKKllooKg=;
	b=C+6xyxWMUega8+jNeVbXSnSqjf+e60QB0x+0Tf7idmVvxn1ZadRGjKgJynK/Ar+2MN
	+xIa3YtktNSTRCfb8HJcGigR575YV0S45NfsmXGHpiLHakFg+3en3UyZdtXdQeH0eIs2
	9zYLmOazpb/v7uWTSDCedjzYxo14jM5Hde9FTOaKK3VGoXWjgIbzLLKqennlTcw31F9A
	MWa8sXqvE7xM//pRgkBGVVYM2ma4oYadUR2l68RqwmoWWXt9oXRrF8/VadY29ya4As76
	NdWVqpHoa8btXzZQ4+4TrnxgSiS6l/KbvE8IEcjfRSB7uPbRiNGziD8Sz869lrAZmH9c
	/BkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=lK38IjC1sIQeGB2g/3BGEFgjg1+SXogCuKZKKllooKg=;
	b=tj6J/1bRqphZGEC9IVFS7gxxX2a0TlbqRvZoFeLTaP/0GiOsiqiRlBmzp9AC1l/j8f
	mQPPFyyGmnMjl6X6nc4ko92+xe4iS2TOzXOfebZg55VhzVRb217Rh6kJCvf9Pl7FykzU
	qROSBp6aqCcm3Ff0jDdSRJ4UxCv1x+++7brRpLv0pY4m1HAiJnO2xJj8lHRF/7IgMTiT
	tHe1hoIXLY7CtT8ciyMa2b4FEcWnJojwxORbwpNdHgYdshVRnsfXtC/bOcMynVWDmfBb
	zNa4Su/DwSLuCawhy/cr4wqcDIR9M5Ru4wXCv+Lx/FOfQ2JGVIYVOHq8LH7rASo7DXdu
	NrLQ==
X-Gm-Message-State: APf1xPCjPrKF+1vd5fd0hUZxTOVDJCZxdRMWkZ2OZUd0uRUip6rZeIo9
	rKsSbeERw8OJbTmqDOWobPH3FA==
X-Google-Smtp-Source: AG47ELv1dHjdzNWPYVwMAR0uYUydVLSAZ3Q8dnxNRv764+QzndLpv1F0MGOsp4B6zc4svkrFHt4NHA==
X-Received: by 10.98.242.65 with SMTP id y1mr15852161pfl.232.1520273021617;
	Mon, 05 Mar 2018 10:03:41 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:95c8:2b55:de97:f11f?
	([2601:202:4000:1184:95c8:2b55:de97:f11f])
	by smtp.gmail.com with ESMTPSA id
	5sm30499788pfh.133.2018.03.05.10.03.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 10:03:41 -0800 (PST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <20180305172046.21729-1-ross.burton@intel.com>
	<20180305172046.21729-2-ross.burton@intel.com>
	<30b5b54b-c330-5bdf-9f3c-454ddde92353@gmail.com>
	<CAJTo0LZ0uoDi5Ant3zM4T4ZgR07JExQ=ZBqRszvBdRpFFKUCqQ@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <72969d24-99fa-2a47-2b61-1102c1675e3c@gmail.com>
Date: Mon, 5 Mar 2018 10:03:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ0uoDi5Ant3zM4T4ZgR07JExQ=ZBqRszvBdRpFFKUCqQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/29] dbus-glib: refresh patch
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
X-List-Received-Date: Mon, 05 Mar 2018 18:03:40 -0000
Content-Type: multipart/alternative;
	boundary="------------8EE5670FF002F070EDF7D9C3"
Content-Language: en-US

--------------8EE5670FF002F070EDF7D9C3
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 03/05/2018 09:30 AM, Burton, Ross wrote:
> I was about to write a long email explaining all this but my dinner is
> almost ready.

Enjoy your dinner.

>
> Short version: patch fuzz is dangerous, we've had patches apply using
> fuzz which actually break the code, or doing something else stupid
> like repeat a statement.
>
> We'd like to eventually have do_patch rejecting any fuzz on these
> grounds, so I wrote a nasty script to rebase all the patches and am
> reviewing them bit by bit.  Note that two of these patches are
> deleting patches that we've been applying although upstream have
> already applied the same fix...
Can you share your script?

- Armin
>
> Ross
>
> On 5 March 2018 at 17:24, akuster808 <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>
>
>     On 03/05/2018 09:20 AM, Ross Burton wrote:
>     > Signed-off-by: Ross Burton <ross.burton@intel.com
>     <mailto:ross.burton@intel.com>>
>
>     Why do this patches need to be refreshed?
>
>     - armin
>     > ---
>     >  meta/recipes-core/dbus/dbus-glib/no-examples.patch | 10 ++++++----
>     >  1 file changed, 6 insertions(+), 4 deletions(-)
>     >
>     > diff --git a/meta/recipes-core/dbus/dbus-glib/no-examples.patch
>     b/meta/recipes-core/dbus/dbus-glib/no-examples.patch
>     > index fbb49678282..32e76117188 100644
>     > --- a/meta/recipes-core/dbus/dbus-glib/no-examples.patch
>     > +++ b/meta/recipes-core/dbus/dbus-glib/no-examples.patch
>     > @@ -5,11 +5,13 @@ Upstream-Status: Inappropriate [disable feature]
>     >  Signed-off-by: Kevin Tian <kevin.tian@intel.com
>     <mailto:kevin.tian@intel.com>>
>     >  Signed-off-by: Scott Garman <scott.a.garman@intel.com
>     <mailto:scott.a.garman@intel.com>>
>     >
>     > ---- dbus-glib-0.70/dbus/Makefile.am.orig     2006-07-23
>     16:04:43.000000000 +0200
>     > -+++ dbus-glib-0.70/dbus/Makefile.am  2006-07-23
>     16:04:52.000000000 +0200
>     > +Index: dbus-glib-0.108/dbus/Makefile.am
>     > +===================================================================
>     > +--- dbus-glib-0.108.orig/dbus/Makefile.am
>     > ++++ dbus-glib-0.108/dbus/Makefile.am
>     >  @@ -1,4 +1,4 @@
>     >  -SUBDIRS = . examples
>     >  +SUBDIRS = .
>     >
>     > - INCLUDES=-I$(top_srcdir) $(DBUS_CFLAGS) $(DBUS_GLIB_CFLAGS)
>     $(DBUS_GLIB_TOOL_CFLAGS) -DDBUS_COMPILATION=1
>     -DDBUS_LOCALEDIR=\"$(prefix)/@DATADIRNAME@/locale\"
>     > -
>     > + AM_CPPFLAGS = \
>     > +     -I$(top_srcdir)                                         \
>
>


--------------8EE5670FF002F070EDF7D9C3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 03/05/2018 09:30 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0LZ0uoDi5Ant3zM4T4ZgR07JExQ=ZBqRszvBdRpFFKUCqQ@mail.gmail.com">
      <div dir="ltr">I was about to write a long email explaining all
        this but my dinner is almost ready.</div>
    </blockquote>
    <br>
    Enjoy your dinner.<br>
    <br>
    <blockquote type="cite"
cite="mid:CAJTo0LZ0uoDi5Ant3zM4T4ZgR07JExQ=ZBqRszvBdRpFFKUCqQ@mail.gmail.com">
      <div dir="ltr">
        <div><br>
        </div>
        <div>Short version: patch fuzz is dangerous, we've had patches
          apply using fuzz which actually break the code, or doing
          something else stupid like repeat a statement.</div>
        <div><br>
        </div>
        <div>We'd like to eventually have do_patch rejecting any fuzz on
          these grounds, so I wrote a nasty script to rebase all the
          patches and am reviewing them bit by bit.  Note that two of
          these patches are deleting patches that we've been applying
          although upstream have already applied the same fix...</div>
      </div>
    </blockquote>
    Can you share your script?<br>
    <br>
    - Armin<br>
    <blockquote type="cite"
cite="mid:CAJTo0LZ0uoDi5Ant3zM4T4ZgR07JExQ=ZBqRszvBdRpFFKUCqQ@mail.gmail.com">
      <div dir="ltr">
        <div><br>
        </div>
        <div>Ross</div>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On 5 March 2018 at 17:24, akuster808 <span
            dir="ltr">&lt;<a href="mailto:akuster808@gmail.com"
              target="_blank" moz-do-not-send="true">akuster808@gmail.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
            <br>
            On 03/05/2018 09:20 AM, Ross Burton wrote:<br>
            &gt; Signed-off-by: Ross Burton &lt;<a
              href="mailto:ross.burton@intel.com" moz-do-not-send="true">ross.burton@intel.com</a>&gt;<br>
            <br>
            Why do this patches need to be refreshed?<br>
            <br>
            - armin<br>
            <div class="HOEnZb">
              <div class="h5">&gt; ---<br>
                &gt;  meta/recipes-core/dbus/dbus-<wbr>glib/no-examples.patch
                | 10 ++++++----<br>
                &gt;  1 file changed, 6 insertions(+), 4 deletions(-)<br>
                &gt;<br>
                &gt; diff --git a/meta/recipes-core/dbus/dbus-<wbr>glib/no-examples.patch
                b/meta/recipes-core/dbus/dbus-<wbr>glib/no-examples.patch<br>
                &gt; index fbb49678282..32e76117188 100644<br>
                &gt; --- a/meta/recipes-core/dbus/dbus-<wbr>glib/no-examples.patch<br>
                &gt; +++ b/meta/recipes-core/dbus/dbus-<wbr>glib/no-examples.patch<br>
                &gt; @@ -5,11 +5,13 @@ Upstream-Status: Inappropriate
                [disable feature]<br>
                &gt;  Signed-off-by: Kevin Tian &lt;<a
                  href="mailto:kevin.tian@intel.com"
                  moz-do-not-send="true">kevin.tian@intel.com</a>&gt;<br>
                &gt;  Signed-off-by: Scott Garman &lt;<a
                  href="mailto:scott.a.garman@intel.com"
                  moz-do-not-send="true">scott.a.garman@intel.com</a>&gt;<br>
                &gt;<br>
                &gt; ---- dbus-glib-0.70/dbus/Makefile.<wbr>am.orig   
                 2006-07-23 16:04:43.000000000 +0200<br>
                &gt; -+++ dbus-glib-0.70/dbus/Makefile.<wbr>am 
                2006-07-23 16:04:52.000000000 +0200<br>
                &gt; +Index: dbus-glib-0.108/dbus/Makefile.<wbr>am<br>
                &gt; +=============================<wbr>==============================<wbr>========<br>
                &gt; +--- dbus-glib-0.108.orig/dbus/<wbr>Makefile.am<br>
                &gt; ++++ dbus-glib-0.108/dbus/Makefile.<wbr>am<br>
                &gt;  @@ -1,4 +1,4 @@<br>
                &gt;  -SUBDIRS = . examples<br>
                &gt;  +SUBDIRS = .<br>
                &gt;<br>
                &gt; - INCLUDES=-I$(top_srcdir) $(DBUS_CFLAGS)
                $(DBUS_GLIB_CFLAGS) $(DBUS_GLIB_TOOL_CFLAGS)
                -DDBUS_COMPILATION=1 -DDBUS_LOCALEDIR=\"$(prefix)/@<wbr>DATADIRNAME@/locale\"<br>
                &gt; -<br>
                &gt; + AM_CPPFLAGS = \<br>
                &gt; +     -I$(top_srcdir)                             
                           \<br>
                <br>
              </div>
            </div>
          </blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------8EE5670FF002F070EDF7D9C3--
