Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3B816605C3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 15:23:20 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 17 Nov 2016 07:23:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,506,1473145200"; 
	d="scan'208,217";a="192578604"
Received: from jgperezc.zpn.intel.com (HELO [10.219.5.31]) ([10.219.5.31])
	by fmsmga004.fm.intel.com with ESMTP; 17 Nov 2016 07:23:21 -0800
To: "Burton, Ross" <ross.burton@intel.com>,
	Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
References: <1479257423-4281-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
	<CAJTo0LbxF0sdYqmK3ttUyaiyTPmg+ME9qbSS1NnpcA4H7iQLaQ@mail.gmail.com>
From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
Message-ID: <358803d5-7678-9c6e-2017-9007263d02d5@linux.intel.com>
Date: Thu, 17 Nov 2016 09:33:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbxF0sdYqmK3ttUyaiyTPmg+ME9qbSS1NnpcA4H7iQLaQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Test needed to verify postinst script order.
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
X-List-Received-Date: Thu, 17 Nov 2016 15:23:21 -0000
Content-Type: multipart/alternative;
	boundary="------------DA3F07FCAF74AF27D72E5FD2"

--------------DA3F07FCAF74AF27D72E5FD2
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 11/17/2016 06:14 AM, Burton, Ross wrote:
>
> On 16 November 2016 at 00:50, Francisco Pedraza 
> <francisco.j.pedraza.gonzalez@intel.com 
> <mailto:francisco.j.pedraza.gonzalez@intel.com>> wrote:
>
>     Will verify the following:
>     1. Compile a minimal image.
>     2. The compiled image will add the created layer with the
>     recipes postinstz postinsta postinstb postinstd postinstp postinstt
>     created previously at "meta-selftest/recipes-test"
>     2. Run qemu
>     3. Validate the task execution order.
>     V4
>
>
> This is missing the test that some postinsts should be happening at 
> rootfs time.
I have assigned the bug 8433 and I will send a different patch to add 
those test cases, I'm just waiting to the final implementation of this  
patch to be accepted to avoid execution and merge conflicts.
>
> Also, can it permute PACKAGE_CLASSES (rotate through all three 
> options) so it exercises all backends.
>
>     Signed-off-by: Francisco Pedraza
>     <francisco.j.pedraza.gonzalez@intel.com
>     <mailto:francisco.j.pedraza.gonzalez@intel.com>>
>     ---
>      .../recipes-test/postinsta/postinsta_1.0.bb
>     <http://postinsta_1.0.bb>        | 20 +++++++++++
>      .../recipes-test/postinstb/postinstb_1.0.bb
>     <http://postinstb_1.0.bb>        | 22 ++++++++++++
>      .../recipes-test/postinstd/postinstd_1.0.bb
>     <http://postinstd_1.0.bb>        | 22 ++++++++++++
>      .../recipes-test/postinstp/postinstp_1.0.bb
>     <http://postinstp_1.0.bb>        | 22 ++++++++++++
>      .../recipes-test/postinstt/postinstt_1.0.bb
>     <http://postinstt_1.0.bb>        | 22 ++++++++++++
>      .../recipes-test/postinstz/postinstz_1.0.bb
>     <http://postinstz_1.0.bb>        | 12 +++++++
>
>
> For clarity can all of these be squashed into a single recipe with 
> clearer names?
>
> Ross
>
>


--------------DA3F07FCAF74AF27D72E5FD2
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 11/17/2016 06:14 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LbxF0sdYqmK3ttUyaiyTPmg+ME9qbSS1NnpcA4H7iQLaQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 16 November 2016 at 00:50,
            Francisco Pedraza <span dir="ltr">&lt;<a
                moz-do-not-send="true"
                href="mailto:francisco.j.pedraza.gonzalez@intel.com"
                target="_blank">francisco.j.pedraza.gonzalez@intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":619" class="a3s aXjCH m1586aa8e9d4ce13a">Will
                verify the following:<br>
                1. Compile a minimal image.<br>
                2. The compiled image will add the created layer with
                the<br>
                recipes postinstz postinsta postinstb postinstd
                postinstp postinstt<br>
                created previously at "meta-selftest/recipes-test"<br>
                2. Run qemu<br>
                3. Validate the task execution order.<br>
                V4<br>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>This is missing the test that some postinsts should be
              happening at rootfs time.</div>
          </div>
        </div>
      </div>
    </blockquote>
    I have assigned the bug 8433 and I will send a different patch to
    add those test cases, I'm just waiting to the final implementation
    of this  patch to be accepted to avoid execution and merge
    conflicts.  <br>
    <blockquote
cite="mid:CAJTo0LbxF0sdYqmK3ttUyaiyTPmg+ME9qbSS1NnpcA4H7iQLaQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div><br>
            </div>
            <div>Also, can it permute PACKAGE_CLASSES (rotate through
              all three options) so it exercises all backends.</div>
            <div><br>
            </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":619" class="a3s aXjCH m1586aa8e9d4ce13a">
                Signed-off-by: Francisco Pedraza &lt;<a
                  moz-do-not-send="true"
                  href="mailto:francisco.j.pedraza.gonzalez@intel.com">francisco.j.pedraza.gonzalez@<wbr>intel.com</a>&gt;<br>
                ---<br>
                 .../recipes-test/postinsta/<a moz-do-not-send="true"
                  href="http://postinsta_1.0.bb" rel="noreferrer"
                  target="_blank">pos<wbr>tinsta_1.0.bb</a>        | 20
                +++++++++++<br>
                 .../recipes-test/postinstb/<a moz-do-not-send="true"
                  href="http://postinstb_1.0.bb" rel="noreferrer"
                  target="_blank">pos<wbr>tinstb_1.0.bb</a>        | 22
                ++++++++++++<br>
                 .../recipes-test/postinstd/<a moz-do-not-send="true"
                  href="http://postinstd_1.0.bb" rel="noreferrer"
                  target="_blank">pos<wbr>tinstd_1.0.bb</a>        | 22
                ++++++++++++<br>
                 .../recipes-test/postinstp/<a moz-do-not-send="true"
                  href="http://postinstp_1.0.bb" rel="noreferrer"
                  target="_blank">pos<wbr>tinstp_1.0.bb</a>        | 22
                ++++++++++++<br>
                 .../recipes-test/postinstt/<a moz-do-not-send="true"
                  href="http://postinstt_1.0.bb" rel="noreferrer"
                  target="_blank">pos<wbr>tinstt_1.0.bb</a>        | 22
                ++++++++++++<br>
                 .../recipes-test/postinstz/<a moz-do-not-send="true"
                  href="http://postinstz_1.0.bb" rel="noreferrer"
                  target="_blank">pos<wbr>tinstz_1.0.bb</a>        | 12
                +++++++</div>
            </blockquote>
          </div>
          <br>
          For clarity can all of these be squashed into a single recipe
          with clearer names?</div>
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

--------------DA3F07FCAF74AF27D72E5FD2--
