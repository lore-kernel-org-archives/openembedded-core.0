Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 60209606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 17:34:33 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 26 Jul 2016 10:34:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,425,1464678000"; 
	d="scan'208,217";a="740058944"
Received: from mlopezva-mobl2.zpn.intel.com (HELO [10.219.5.49])
	([10.219.5.49])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Jul 2016 10:34:33 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1469518569.git.mariano.lopez@linux.intel.com>
	<e87916a7973816a5310ca4b4574c6aac61a86741.1469518569.git.mariano.lopez@linux.intel.com>
	<CAJTo0LZ_xcHiNGjWs7bJ7G9Tm6Zn5PDyPK5ppXHCdC7fekSk0g@mail.gmail.com>
From: Mariano Lopez <mariano.lopez@linux.intel.com>
Message-ID: <57979F37.5090304@linux.intel.com>
Date: Tue, 26 Jul 2016 12:34:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ_xcHiNGjWs7bJ7G9Tm6Zn5PDyPK5ppXHCdC7fekSk0g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] oeqa/utils/commands.py: Add oeqa_copy function
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
X-List-Received-Date: Tue, 26 Jul 2016 17:34:34 -0000
Content-Type: multipart/alternative;
	boundary="------------060800080508080107030103"

--------------060800080508080107030103
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/26/2016 11:13 AM, Burton, Ross wrote:
>
> On 26 July 2016 at 08:39, <mariano.lopez@linux.intel.com 
> <mailto:mariano.lopez@linux.intel.com>> wrote:
>
>     +def oeqa_copy(src, dst):
>     +    """
>     +    Copy files and symlinks trying to preserve metadata.
>     +    """
>     +
>     +    shutil.copy2(src, dst, follow_symlinks=False)
>
>
> Why not just use shutil directly instead of having a wrapper function?

shutil.copytree didn't play nice with the symlinks, this is why I added 
this function, nevertheless, I like Joshua's approach of use 
oe.path.copytree(), so this function won't be needed.

>
> Ross

Mariano

--------------060800080508080107030103
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <br>
    <div class="moz-cite-prefix">On 07/26/2016 11:13 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LZ_xcHiNGjWs7bJ7G9Tm6Zn5PDyPK5ppXHCdC7fekSk0g@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 26 July 2016 at 08:39, <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:mariano.lopez@linux.intel.com"
                target="_blank">mariano.lopez@linux.intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":26q" class="a3s aXjCH m15627e33faca692c">+def
                oeqa_copy(src, dst):<br>
                +    """<br>
                +    Copy files and symlinks trying to preserve
                metadata.<br>
                +    """<br>
                +<br>
                +    shutil.copy2(src, dst, follow_symlinks=False)</div>
            </blockquote>
          </div>
          <br>
          Why not just use shutil directly instead of having a wrapper
          function?</div>
      </div>
    </blockquote>
    <br>
    shutil.copytree didn't play nice with the symlinks, this is why I
    added this function, nevertheless, I like Joshua's approach of use
    oe.path.copytree(), so this function won't be needed.<br>
    <br>
    <blockquote
cite="mid:CAJTo0LZ_xcHiNGjWs7bJ7G9Tm6Zn5PDyPK5ppXHCdC7fekSk0g@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
    <div class="moz-signature">Mariano</div>
  </body>
</html>

--------------060800080508080107030103--
