Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id BB70177128
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 20:02:52 +0000 (UTC)
Received: by igbif5 with SMTP id if5so2889762igb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 13:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=djk9dtTWjyxWDP40WWMmL9hl3IkwqQDt9e0iqi9AFv0=;
	b=ensxlQPyyqg6QDUozb+k5k7hoCYTt+/af9uRQC4A/eGpwh/qxawcn72KoeZ9XzbEFi
	osZwjx16CmpVFshtxxrqo2gAwYMycHnYBRidrbkWWmAp00mpCO3k1bscWHgf+aWNmiiY
	G/GXNrx2TH/7Ympl/Yy7z5/4w9V6MOHx7tEB5m0Ix9L6XFThJRbCLlaoxw+O7p4l99fW
	Iz5qfn0sb1GtlaYYbzJxWtpZ4aT0eKXK6IrtSBOogwRcC7SuuSTa/2/SIfPeWjIg1yLr
	9Z2MmA/nZ2Eg6Y3la6XFOc4WYx/nl04ViLPJoY0x+53YYIQjwPEYmPCt3Bp6j4eQUl37
	Yn3A==
MIME-Version: 1.0
X-Received: by 10.50.143.4 with SMTP id sa4mr931585igb.52.1444939372873; Thu,
	15 Oct 2015 13:02:52 -0700 (PDT)
Received: by 10.36.98.143 with HTTP; Thu, 15 Oct 2015 13:02:52 -0700 (PDT)
In-Reply-To: <CAJTo0Lb+ocUQw0O=423w9MO9Tr=J64yTb==GxHzWhQgUu7=AvQ@mail.gmail.com>
References: <cover.1444392901.git.jussi.kukkonen@intel.com>
	<CALbNGRSLEKJUYXgMCdv_oB+JD++AemnvNyM8cmCqD7o26wXqeQ@mail.gmail.com>
	<CALbNGRSUht+HkkJOkv0NZ38yjcOdahPRVOhar830BbcSFYEj9Q@mail.gmail.com>
	<CAJTo0Lb+ocUQw0O=423w9MO9Tr=J64yTb==GxHzWhQgUu7=AvQ@mail.gmail.com>
Date: Thu, 15 Oct 2015 22:02:52 +0200
Message-ID: <CALbNGRTPFkfP5CRa=qH18OLX8D7qgxNQx35jOEJakfAUvXMZSw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [PATCH 0/1] Solving the GTK+ libgl runtime dependency issue
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
X-List-Received-Date: Thu, 15 Oct 2015 20:02:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2015 at 9:42 PM, Burton, Ross <ross.burton@intel.com> wrote=
:
> On 15 October 2015 at 18:26, Andreas M=C3=BCller <schnitzeltony@googlemai=
l.com>
> wrote:
>
>> I have several gtk3+ applications that stopped working. E.G
>> network-manager-applet has stopped working: running
>> nm-connection-editor fails with 'Couldn't open libGL.so.1'. Same for
>> parole.
>> I grepped network-manager-applet: there is not GtkGL or GdkGL found in
>> the sources (ok - it could be the dependencies). I still get the
>> feeling something goes wrong with libepoxy. And I am quite sure that
>> I've seen both (nm-applet/parole) running with gtk3 requiring
>> libepoxy...
>>
>
> That's not good, sounds like a bug in GTK+3 - it shouldn't be initialisin=
g
> the GL code.
>
> The only bit of source that includes epoxy is gtkglarea.c.  libepoxy only
> looks up libGL.so.1 when it's invoked.
That makes it even more mysterious...
>
> What's the exact message you get, and bonus points if you can attach a gd=
b
> with debug symbols to get a backtrace.  Maybe something like Glade is
> instantiating every class?
>
I moved this thread to core - I sent to wrong list - sorry

Error messages are
[operator@raspberrypi2 ~]$ nm-connection-editor
Couldn't open libGL.so.1: libGL.so.1: cannot open shared object file:
No such file or directory
[operator@raspberrypi2 ~]$ parole
Couldn't open libGL.so.1: libGL.so.1: cannot open shared object file:
No such file or directory

Yes gdb is what I try next.

Andreas

