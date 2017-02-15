Return-Path: <amarnath.valluri@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C711C7665F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 10:51:48 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Feb 2017 02:51:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,165,1484035200"; d="scan'208,217";a="44736844"
Received: from irdmzpr05.ir.intel.com (HELO [163.33.54.155]) ([163.33.54.155])
	by orsmga002.jf.intel.com with ESMTP; 15 Feb 2017 02:51:47 -0800
To: openembedded-core@lists.openembedded.org
References: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
	<5eb1a4810bf745c5932feee2d1b47621353e9689.1486997986.git.alexander.kanavin@linux.intel.com>
	<1487154986.2824.6.camel@andred.net>
From: avalluri <amarnath.valluri@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <cf49add5-c621-3d50-43eb-66cef09fca8d@intel.com>
Date: Wed, 15 Feb 2017 12:51:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1487154986.2824.6.camel@andred.net>
Subject: Re: [PATCH 36/36] package_deb.bbclass: Ignore file paths in RPROVIDES
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
X-List-Received-Date: Wed, 15 Feb 2017 10:51:48 -0000
Content-Type: multipart/alternative;
	boundary="------------2AAE7F0985F1BC67ED17F846"

--------------2AAE7F0985F1BC67ED17F846
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 15.02.2017 12:36, André Draszik wrote:
> On Mon, 2017-02-13 at 17:06 +0200, Alexander Kanavin wrote:
>> From: Amarnath Valluri<amarnath.valluri@intel.com>
>>
>> Unlike rpm, debian packaging does not allow file paths in 'Provides:'
>> field.
>> When 'usrmerge' distro feature enabled bash/busybox packages adds
>> '/bin/sh' to
>> it's RPROVIDES to satisfy build dependencies, this entry should be
>> filtered out.
> What about opkg - is it OK with PATHs (my blind guess would be no)? Has it
> been tested?
Yes, i tested wit 'ipk' packaging, it did not complain about file paths.

Amarnath


--------------2AAE7F0985F1BC67ED17F846
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 15.02.2017 12:36, André Draszik
      wrote:<br>
    </div>
    <blockquote cite="mid:1487154986.2824.6.camel@andred.net"
      type="cite">
      <pre wrap="">On Mon, 2017-02-13 at 17:06 +0200, Alexander Kanavin wrote:
</pre>
      <blockquote type="cite" style="color: #000000;">
        <pre wrap="">From: Amarnath Valluri <a moz-do-not-send="true" class="moz-txt-link-rfc2396E" href="mailto:amarnath.valluri@intel.com">&lt;amarnath.valluri@intel.com&gt;</a>

Unlike rpm, debian packaging does not allow file paths in 'Provides:'
field.
When 'usrmerge' distro feature enabled bash/busybox packages adds
'/bin/sh' to
it's RPROVIDES to satisfy build dependencies, this entry should be
filtered out.
</pre>
      </blockquote>
      <pre wrap="">What about opkg - is it OK with PATHs (my blind guess would be no)? Has it
been tested?</pre>
    </blockquote>
    Yes, i tested wit 'ipk' packaging, it did not complain about file
    paths.<br>
    <br>
    Amarnath<br>
    <br>
  </body>
</html>

--------------2AAE7F0985F1BC67ED17F846--
