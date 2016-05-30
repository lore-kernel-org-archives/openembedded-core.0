Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8BD72731F9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2016 20:35:12 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 30 May 2016 13:35:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,391,1459839600"; 
	d="scan'208,217";a="991761133"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.5.101])
	([10.219.5.101])
	by fmsmga002.fm.intel.com with ESMTP; 30 May 2016 13:35:14 -0700
To: openembedded-core@lists.openembedded.org
References: <555B53AB.2010804@mlbassoc.com>
	<CAJTo0LaGPMOHEdYNSGCWipQm=mqUGPANr6kaK7EzXpXbSBuO0g@mail.gmail.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <7187f6d1-4872-faa5-3b19-26c2ba102f7f@linux.intel.com>
Date: Mon, 30 May 2016 15:36:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaGPMOHEdYNSGCWipQm=mqUGPANr6kaK7EzXpXbSBuO0g@mail.gmail.com>
Subject: Re: media player (gtk-play)
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
X-List-Received-Date: Mon, 30 May 2016 20:35:15 -0000
Content-Type: multipart/alternative;
	boundary="------------2A7AAF7D41A8839C1BB02514"

--------------2A7AAF7D41A8839C1BB02514
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

You can try

export GST_DEBUG=GST_ELEMENT_FACTORY:3

then run gstreamer. Log indicates which elements are being used.


Leo

On 05/19/2015 12:44 PM, Burton, Ross wrote:
>
> On 19 May 2015 at 16:15, Gary Thomas <gary@mlbassoc.com 
> <mailto:gary@mlbassoc.com>> wrote:
>
>     Do you know if there is a way to tell gtk-play what gstreamer
>     back-end(s) to use?  In particular, for my i.MX6 board, it is
>     not choosing the video plugin I think it should and it would be
>     nice to test if it does the right thing if the correct plugin
>     is used.
>
>
> I guess there's a few solutions:
>
> 1) Patch gst-player (upstream is very responsive!) to add options to 
> pass these hints to the playbin
> 2) Delete the plugins you don't want it to use
> 3) Use gst-launch directly to do these tests (gst-launch playbin 
> video-sink=foosink uri=...)
>
> For (1) this should be a fairly simple matter of passing the sink 
> name, then constructing that element and passing it as the 
> audio-sink/video-sink property on the playbin.
>
> Ross
>
>


--------------2A7AAF7D41A8839C1BB02514
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p>You can try<br>
    </p>
    <p>export GST_DEBUG=GST_ELEMENT_FACTORY:3</p>
    <p>then run gstreamer. Log indicates which elements are being used.</p>
    <p><br>
    </p>
    <p>Leo<br>
    </p>
    <div class="moz-cite-prefix">On 05/19/2015 12:44 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LaGPMOHEdYNSGCWipQm=mqUGPANr6kaK7EzXpXbSBuO0g@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 19 May 2015 at 16:15, Gary Thomas
            <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:gary@mlbassoc.com" target="_blank">gary@mlbassoc.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div style="overflow:hidden">Do you know if there is a way
                to tell gtk-play what gstreamer<br>
                back-end(s) to use?  In particular, for my i.MX6 board,
                it is<br>
                not choosing the video plugin I think it should and it
                would be<br>
                nice to test if it does the right thing if the correct
                plugin<br>
                is used.</div>
            </blockquote>
          </div>
          <br>
          I guess there's a few solutions:</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">1) Patch gst-player (upstream is very
          responsive!) to add options to pass these hints to the playbin</div>
        <div class="gmail_extra">2) Delete the plugins you don't want it
          to use</div>
        <div class="gmail_extra">3) Use gst-launch directly to do these
          tests (gst-launch playbin video-sink=foosink uri=...)</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">For (1) this should be a fairly simple
          matter of passing the sink name, then constructing that
          element and passing it as the audio-sink/video-sink property
          on the playbin.</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------2A7AAF7D41A8839C1BB02514--
