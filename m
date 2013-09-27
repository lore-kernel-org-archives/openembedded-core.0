Return-Path: <jason.wessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D911861005
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 21:20:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8RLKchK002894
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 27 Sep 2013 14:20:38 -0700 (PDT)
Received: from [172.25.32.36] (172.25.32.36) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 27 Sep 2013 14:20:38 -0700
Message-ID: <5245F6A4.2050709@windriver.com>
Date: Fri, 27 Sep 2013 16:20:36 -0500
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: Andrea Adami <andrea.adami@gmail.com>
References: <1380299019-10777-1-git-send-email-jason.wessel@windriver.com>
	<CAAQYJAsFbxdCsOTKRKMk+TMHe2=oAjw4vOaAwKpWMbKfwHHpfg@mail.gmail.com>
In-Reply-To: <CAAQYJAsFbxdCsOTKRKMk+TMHe2=oAjw4vOaAwKpWMbKfwHHpfg@mail.gmail.com>
X-Enigmail-Version: 1.5.2
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel.bbclass: Allow INITRAMFS_TASK to trigger copy initramfs code
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
X-List-Received-Date: Fri, 27 Sep 2013 21:20:39 -0000
Content-Type: multipart/alternative;
	boundary="------------050906090001040606040603"

--------------050906090001040606040603
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 09/27/2013 04:06 PM, Andrea Adami wrote:
> | DEBUG: Executing shell function do_compile
> | Copying initramfs into ./usr ...
> | cp: cannot create regular file
> '/oe/oe-core/build/tmp-eglibc/work/poodle-oe-linux-gnueabi/linux-yocto-tiny-kexecboot/3.10.11+gitAUTOINC+dad2b7e1ce_e1aa804148-r0/linux-poodle-tiny-build/usr/.':


I suppose that one makes sense given that the compile directory might not exist.  My testing did not show this problem because my working env was "dirty".

Thanks for the report, your fix is perfectly fine.  I'll send a v2.

Jason.

--------------050906090001040606040603
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 09/27/2013 04:06 PM, Andrea Adami
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAAQYJAsFbxdCsOTKRKMk+TMHe2=oAjw4vOaAwKpWMbKfwHHpfg@mail.gmail.com"
      type="cite">
      <pre wrap="">| DEBUG: Executing shell function do_compile
| Copying initramfs into ./usr ...
| cp: cannot create regular file
'<i class="moz-txt-slash"><span class="moz-txt-tag">/</span>oe/oe-core/build/tmp-eglibc/work/poodle-oe-linux-gnueabi/linux-yocto-tiny-kexecboot/3.10.11+gitAUTOINC+dad2b7e1ce_e1aa804148-r0/linux-poodle-tiny-build/usr<span class="moz-txt-tag">/</span></i>.':</pre>
    </blockquote>
    <br>
    <br>
    I suppose that one makes sense given that the compile directory
    might not exist.&nbsp; My testing did not show this problem because my
    working env was "dirty".<br>
    <br>
    Thanks for the report, your fix is perfectly fine.&nbsp; I'll send a v2.<br>
    <br>
    Jason.<br>
  </body>
</html>

--------------050906090001040606040603--
