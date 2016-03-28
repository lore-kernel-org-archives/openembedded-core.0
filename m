Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E2CAD70031
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 18:08:30 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 28 Mar 2016 11:08:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,407,1455004800"; 
	d="scan'208,217";a="773270934"
Received: from mlopezva-mobl2.zpn.intel.com (HELO [10.219.26.0])
	([10.219.26.0])
	by orsmga003.jf.intel.com with ESMTP; 28 Mar 2016 11:08:31 -0700
To: Christopher Larson <clarson@kergoth.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1458803813.git.mariano.lopez@linux.intel.com>
	<34e4b28e8c8e665b38fd82d59ecaf8d486de6193.1458803813.git.mariano.lopez@linux.intel.com>
	<CABcZANkt+zzsRKL7ao2aP81Cu7Easc5rmmGHQzBdy0jwRNTDQg@mail.gmail.com>
From: Mariano Lopez <mariano.lopez@linux.intel.com>
Message-ID: <56F97344.9040204@linux.intel.com>
Date: Mon, 28 Mar 2016 12:09:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CABcZANkt+zzsRKL7ao2aP81Cu7Easc5rmmGHQzBdy0jwRNTDQg@mail.gmail.com>
Subject: Re: [PATCH 1/1] archiver.bbclass: Just archive gcc-source for all gcc recipes
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
X-List-Received-Date: Mon, 28 Mar 2016 18:08:31 -0000
Content-Type: multipart/alternative;
	boundary="------------010405030208040600000705"

--------------010405030208040600000705
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/24/2016 12:04 PM, Christopher Larson wrote:
>
>
> On Thu, Mar 24, 2016 at 8:26 AM <mariano.lopez@linux.intel.com 
> <mailto:mariano.lopez@linux.intel.com>> wrote:
>
>     From: Mariano Lopez <mariano.lopez@linux.intel.com
>     <mailto:mariano.lopez@linux.intel.com>>
>     +    # We just archive gcc-source for all the gcc related recipes
>     +    if d.getVar('BPN', True) in ['gcc', 'libgcc'] \
>     +            and not pn.startswith('gcc-source'):
>     +        bb.debug(1, 'archiver: %s is excluded, covered by
>     gcc-source' % pn)
>     +        return
>
>
> Hmm, I wonder if it'd be possible to make this more generic, check for 
> work-shared or something.

I was thinking the same when writing the patch, but it seems gcc is more 
of a corner case. The only two recipes that use work-shared are gcc and 
the kernel, the kernel case it's already covered checking for the class 
"kernel-yocto". In case of gcc we can't check for a class, we would need 
for work-shared and gcc, and that would be the almost the same 
comparison as is in the patch.

Mariano

--------------010405030208040600000705
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <br>
    <div class="moz-cite-prefix">On 03/24/2016 12:04 PM, Christopher
      Larson wrote:<br>
    </div>
    <blockquote
cite="mid:CABcZANkt+zzsRKL7ao2aP81Cu7Easc5rmmGHQzBdy0jwRNTDQg@mail.gmail.com"
      type="cite">
      <div dir="ltr"><br>
        <br>
        <div class="gmail_quote">
          <div dir="ltr">On Thu, Mar 24, 2016 at 8:26 AM &lt;<a
              moz-do-not-send="true"
              href="mailto:mariano.lopez@linux.intel.com"><a class="moz-txt-link-abbreviated" href="mailto:mariano.lopez@linux.intel.com">mariano.lopez@linux.intel.com</a></a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">From:
            Mariano Lopez &lt;<a moz-do-not-send="true"
              href="mailto:mariano.lopez@linux.intel.com"
              target="_blank">mariano.lopez@linux.intel.com</a>&gt;<br>
            +    # We just archive gcc-source for all the gcc related
            recipes<br>
            +    if d.getVar('BPN', True) in ['gcc', 'libgcc'] \<br>
            +            and not pn.startswith('gcc-source'):<br>
            +        bb.debug(1, 'archiver: %s is excluded, covered by
            gcc-source' % pn)<br>
            +        return<br>
          </blockquote>
          <div><br>
          </div>
          <div>Hmm, I wonder if it'd be possible to make this more
            generic, check for work-shared or something. <br>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    I was thinking the same when writing the patch, but it seems gcc is
    more of a corner case. The only two recipes that use work-shared are
    gcc and the kernel, the kernel case it's already covered checking
    for the class "kernel-yocto". In case of gcc we can't check for a
    class, we would need for work-shared and gcc, and that would be the
    almost the same comparison as is in the patch.<br>
    <br>
    <div class="moz-signature">Mariano<br>
    </div>
  </body>
</html>

--------------010405030208040600000705--
