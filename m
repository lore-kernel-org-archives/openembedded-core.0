Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1D96162134
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 15:17:18 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Oct 2017 08:16:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,432,1503385200"; 
	d="scan'208,217";a="327591025"
Received: from jalamego-mobl3.zpn.intel.com (HELO [10.219.128.147])
	([10.219.128.147])
	by fmsmga004.fm.intel.com with ESMTP; 25 Oct 2017 08:16:40 -0700
To: openembedded-core@lists.openembedded.org
References: <1508934851-3067-1-git-send-email-holzmayr@rsi-elektrotechnik.de>
From: Jose Lamego <jose.a.lamego@linux.intel.com>
Message-ID: <706ad8ef-39de-02ea-6475-f6caf2012cb5@linux.intel.com>
Date: Wed, 25 Oct 2017 10:16:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1508934851-3067-1-git-send-email-holzmayr@rsi-elektrotechnik.de>
Subject: Re: [PATCH 0/2] version bump bc to 1.07.1
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
X-List-Received-Date: Wed, 25 Oct 2017 15:17:19 -0000
Content-Type: multipart/alternative;
	boundary="------------D983F601F8FABB4884C60C89"
Content-Language: en-US

--------------D983F601F8FABB4884C60C89
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Josef,

A previous upgrade attempt [1] showed that bc version 1.07.1 not only 
needs ed in the host (a regression from 1.06) but also shows a Parallel 
Make Race that requires unsetting PARALLEL_MAKE variable. I contacted 
the upstream maintainer and he is aware of this situation and has 
developed and tested a version 1.07.2, (however is not available for 
download yet). The upgrade was delayed for this reason (more details in 
the patch comments thread).

That said, Is there any urgent need for the upgrade to 1.07.1?

On a side note, I believe bc 1.07.1 license should be GPLv3+ & LGPLv3 
only, unless I'm missing something.

Regards

Jose

References:

[1] https://patchwork.openembedded.org/series/6796/

[2] https://patchwork.openembedded.org/patch/140001/


On 25/10/17 07:34, Josef Holzmayr wrote:
> This series bumps bc to version 1.07.1.
>
> The changes include the needed:
> - change of license to GPLv3 & LGPLv3 & GPLv2+
> - removal of patch which has been upstreamed
> - add native class to ed as it is now a build time dependency
>
> Josef Holzmayr (2):
>    ed: add native class
>    bc: bump version to 1.07.1
>
>   meta/recipes-extended/bc/bc_1.06.bb                | 26 --------------------
>   meta/recipes-extended/bc/bc_1.07.1.bb              | 25 +++++++++++++++++++
>   .../bc/files/fix-segment-fault.patch               | 28 ----------------------
>   meta/recipes-extended/ed/ed_1.14.2.bb              |  3 +++
>   4 files changed, 28 insertions(+), 54 deletions(-)
>   delete mode 100644 meta/recipes-extended/bc/bc_1.06.bb
>   create mode 100644 meta/recipes-extended/bc/bc_1.07.1.bb
>   delete mode 100644 meta/recipes-extended/bc/files/fix-segment-fault.patch
>
>
>


--------------D983F601F8FABB4884C60C89
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Josef,</p>
    <p>A previous upgrade attempt [1] showed that bc version 1.07.1 not
      only needs ed in the host (a regression from 1.06) but also shows
      a Parallel Make Race that requires unsetting PARALLEL_MAKE
      variable. I contacted the upstream maintainer and he is aware of
      this situation and has developed and tested a version 1.07.2,
      (however is not available for download yet). The upgrade was
      delayed for this reason (more details in the patch comments
      thread).</p>
    <p>That said, Is there any urgent need for the upgrade to 1.07.1?</p>
    <p>On a side note, I believe bc 1.07.1 license should be GPLv3+
      &amp; LGPLv3 only, unless I'm missing something.<br>
    </p>
    <p>Regards</p>
    <p>Jose<br>
    </p>
    <p>References:</p>
    <p>[1] <a class="moz-txt-link-freetext" href="https://patchwork.openembedded.org/series/6796/">https://patchwork.openembedded.org/series/6796/</a></p>
    <p>[2] <a class="moz-txt-link-freetext" href="https://patchwork.openembedded.org/patch/140001/">https://patchwork.openembedded.org/patch/140001/</a></p>
    <br>
    <div class="moz-cite-prefix">On 25/10/17 07:34, Josef Holzmayr
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:1508934851-3067-1-git-send-email-holzmayr@rsi-elektrotechnik.de">
      <pre wrap="">This series bumps bc to version 1.07.1.

The changes include the needed:
- change of license to GPLv3 &amp; LGPLv3 &amp; GPLv2+
- removal of patch which has been upstreamed
- add native class to ed as it is now a build time dependency

Josef Holzmayr (2):
  ed: add native class
  bc: bump version to 1.07.1

 meta/recipes-extended/bc/bc_1.06.bb                | 26 --------------------
 meta/recipes-extended/bc/bc_1.07.1.bb              | 25 +++++++++++++++++++
 .../bc/files/fix-segment-fault.patch               | 28 ----------------------
 meta/recipes-extended/ed/ed_1.14.2.bb              |  3 +++
 4 files changed, 28 insertions(+), 54 deletions(-)
 delete mode 100644 meta/recipes-extended/bc/bc_1.06.bb
 create mode 100644 meta/recipes-extended/bc/bc_1.07.1.bb
 delete mode 100644 meta/recipes-extended/bc/files/fix-segment-fault.patch

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------D983F601F8FABB4884C60C89--
