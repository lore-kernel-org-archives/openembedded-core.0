Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4F2A365C85
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 22:50:03 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Jan 2015 14:46:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,752,1413270000"; 
	d="scan'208,217";a="636868910"
Received: from aehernan-devstation.zpn.intel.com (HELO [10.219.4.144])
	([10.219.4.144])
	by orsmga001.jf.intel.com with ESMTP; 13 Jan 2015 14:49:22 -0800
Message-ID: <54B5A103.4000201@linux.intel.com>
Date: Tue, 13 Jan 2015 16:49:39 -0600
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1418337489.git.alejandro.hernandez@linux.intel.com>
	<4bedbe90e0589179b7c6010818a63596a9502671.1418337489.git.alejandro.hernandez@linux.intel.com>
	<CAJTo0LZ+j_=yrHQNAWUkjYyvg9P5BZFLZ-4YhPDLHgnqFBtJ-w@mail.gmail.com>
In-Reply-To: <CAJTo0LZ+j_=yrHQNAWUkjYyvg9P5BZFLZ-4YhPDLHgnqFBtJ-w@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] insane.bbclass: Added QA test for expanded ${D}
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
X-List-Received-Date: Tue, 13 Jan 2015 22:50:12 -0000
Content-Type: multipart/alternative;
	boundary="------------060902020805050501000701"

--------------060902020805050501000701
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Thank Ross, sending new patch soon.
On 07/01/15 12:27, Burton, Ross wrote:
> Hi Alejandro,
>
> Looks good, but some small points:
>
> On 11 December 2014 at 22:40, Alejandro Hernandez 
> <alejandro.hernandez@linux.intel.com 
> <mailto:alejandro.hernandez@linux.intel.com>> wrote:
>
>     -           version-going-backwards \
>     +            version-going-backwards expanded_d \
>
>     +QAPATHTEST[expanded_d] = "package_qa_check_expanded_d"
>
>
> Rename this to expanded-d for consistency with the other symbols that 
> use - instead of _.
>
>     +           # Variables are actually var_${PN}
>
>
> No need to document idioms, remove this comment.
>
>     +                       messages["expanded_d"] = "FILES should not
>     contain the ${D} variable as it references the local build
>     directory not the target filesystem, best solution is to remove
>     the ${D} reference"
>
>
> This doesn't name the package which makes it tricky to find in large 
> builds.
>
> Ross
>


--------------060902020805050501000701
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Thank Ross, sending new patch soon.<br>
    <div class="moz-cite-prefix">On 07/01/15 12:27, Burton, Ross wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LZ+j_=yrHQNAWUkjYyvg9P5BZFLZ-4YhPDLHgnqFBtJ-w@mail.gmail.com"
      type="cite">
      <div dir="ltr">Hi Alejandro,
        <div><br>
        </div>
        <div>Looks good, but some small points:</div>
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 11 December 2014 at 22:40,
            Alejandro Hernandez <span dir="ltr">&lt;<a
                moz-do-not-send="true"
                href="mailto:alejandro.hernandez@linux.intel.com"
                target="_blank">alejandro.hernandez@linux.intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">- 
                        version-going-backwards \<br>
              +            version-going-backwards expanded_d \<br>
            </blockquote>
            <div>
              <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">+QAPATHTEST[expanded_d]
                = "package_qa_check_expanded_d"<br>
              </blockquote>
            </div>
            <div><br>
            </div>
            <div>Rename this to expanded-d for consistency with the
              other symbols that use - instead of _.</div>
            <div>  </div>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">+ 
                        # Variables are actually var_${PN}<br>
            </blockquote>
            <div><br>
            </div>
            <div>No need to document idioms, remove this comment.</div>
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">+ 
                                    messages["expanded_d"] = "FILES
              should not contain the ${D} variable as it references the
              local build directory not the target filesystem, best
              solution is to remove the ${D} reference"<br>
            </blockquote>
            <div><br>
            </div>
            <div>This doesn't name the package which makes it tricky to
              find in large builds.</div>
            <div><br>
            </div>
            <div>Ross </div>
          </div>
          <br>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------060902020805050501000701--
