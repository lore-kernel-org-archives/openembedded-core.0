Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id A78E877E55
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 17:23:16 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga104.jf.intel.com with ESMTP; 26 Sep 2017 10:23:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,441,1500966000"; 
	d="scan'208,217";a="316446208"
Received: from zalatorx-wtg.amr.corp.intel.com (HELO [10.252.252.73])
	([10.252.252.73])
	by fmsmga004.fm.intel.com with ESMTP; 26 Sep 2017 10:23:16 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <20170926165637.36321-1-alejandro.hernandez@linux.intel.com>
	<CAJTo0LZOkD1OOws7Fa2bHGBs5093Koiy=619CGUUZs7UOzYNaQ@mail.gmail.com>
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <a1a29ef4-1e62-1455-2810-6388a076c038@linux.intel.com>
Date: Tue, 26 Sep 2017 12:23:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZOkD1OOws7Fa2bHGBs5093Koiy=619CGUUZs7UOzYNaQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python-native: Build with ipv6 enabled
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
X-List-Received-Date: Tue, 26 Sep 2017 17:23:16 -0000
Content-Type: multipart/alternative;
	boundary="------------5FDB60F8E806011CFB8BF218"
Content-Language: en-US

--------------5FDB60F8E806011CFB8BF218
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hey Ross,


On 09/26/2017 12:16 PM, Burton, Ross wrote:
> On 26 September 2017 at 17:56, Alejandro Hernandez 
> <alejandro.hernandez@linux.intel.com 
> <mailto:alejandro.hernandez@linux.intel.com>> wrote:
>
>     This patch fixes the implementation of EXTRA_OECONF to get the ipv6
>     configuration correctly (whether were building for native or target),
>     and it also modifies DISTRO_FEATURES_NATIVE to add ipv6 by default,
>     simply to get it working like it was before changes were made'
>
>
Using EXTRA_OECONF_append gets added to the correct 
EXTRA_OECONF_class-<target/natve> correctly, otherwise its disregarded.

> Why are changes beyond adding to DISTRO_FEATURES_NATIVE required at all?
>
> Ross


--------------5FDB60F8E806011CFB8BF218
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hey Ross,<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 09/26/2017 12:16 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0LZOkD1OOws7Fa2bHGBs5093Koiy=619CGUUZs7UOzYNaQ@mail.gmail.com">
      <div dir="ltr">On 26 September 2017 at 17:56, Alejandro Hernandez
        <span dir="ltr">&lt;<a
            href="mailto:alejandro.hernandez@linux.intel.com"
            target="_blank" moz-do-not-send="true">alejandro.hernandez@linux.intel.com</a>&gt;</span>
        wrote:<br>
        <div class="gmail_extra">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">This
              patch fixes the implementation of EXTRA_OECONF to get the
              ipv6<br>
              configuration correctly (whether were building for native
              or target),<br>
              and it also modifies DISTRO_FEATURES_NATIVE to add ipv6 by
              default,<br>
              simply to get it working like it was before changes were
              made'<br>
            </blockquote>
            <div><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    Using EXTRA_OECONF_append gets added to the correct
    EXTRA_OECONF_class-&lt;target/natve&gt; correctly, otherwise its
    disregarded.<br>
    <br>
    <blockquote type="cite"
cite="mid:CAJTo0LZOkD1OOws7Fa2bHGBs5093Koiy=619CGUUZs7UOzYNaQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div>Why are changes beyond adding to DISTRO_FEATURES_NATIVE
              required at all?</div>
            <div><br>
            </div>
            <div>Ross </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------5FDB60F8E806011CFB8BF218--
