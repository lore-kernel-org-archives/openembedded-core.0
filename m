Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 4411E77D0A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 17:47:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 26 Sep 2017 10:47:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,441,1500966000"; 
	d="scan'208,217";a="1199259383"
Received: from zalatorx-wtg.amr.corp.intel.com (HELO [10.252.252.73])
	([10.252.252.73])
	by fmsmga001.fm.intel.com with ESMTP; 26 Sep 2017 10:47:25 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <20170926165637.36321-1-alejandro.hernandez@linux.intel.com>
	<CAJTo0LZOkD1OOws7Fa2bHGBs5093Koiy=619CGUUZs7UOzYNaQ@mail.gmail.com>
	<a1a29ef4-1e62-1455-2810-6388a076c038@linux.intel.com>
	<CAJTo0Lb-RHGu+pPOb+Aa-i7DFi_YsvzuaTy7g8+zXDxOt8FXqg@mail.gmail.com>
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <0a030b52-93a5-67d2-e7ad-e7492b35f39a@linux.intel.com>
Date: Tue, 26 Sep 2017 12:47:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb-RHGu+pPOb+Aa-i7DFi_YsvzuaTy7g8+zXDxOt8FXqg@mail.gmail.com>
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
X-List-Received-Date: Tue, 26 Sep 2017 17:47:26 -0000
Content-Type: multipart/alternative;
	boundary="------------23974A7BF6D3D3CD4A93ADEB"
Content-Language: en-US

--------------23974A7BF6D3D3CD4A93ADEB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 09/26/2017 12:25 PM, Burton, Ross wrote:
> On 26 September 2017 at 18:23, Alejandro Hernandez 
> <alejandro.hernandez@linux.intel.com 
> <mailto:alejandro.hernandez@linux.intel.com>> wrote:
>
>>     Using EXTRA_OECONF_append gets added to the correct
>>     EXTRA_OECONF_class-<target/natve> correctly, otherwise its
>>     disregarded.
>
>
> I guess the subtext was
>
> +EXTRA_OECONF_class-native = "\
> + --enable-ipv6=${@bb.utils.contains('DISTRO_FEATURES_NATIVE', 'ipv6', 
> 'yes', 'no', d)} \
>
>
> That is totally wrong.  In a native recipe, DISTRO_FEATURES has been 
> altered based on DISTRO_FEATURES_NATIVE.  You don't need to make other 
> changes, and I suspect that reverting this chunk means the other 
> chunks can also be reverted.
I see your point, seems like I got confused, I just checked and the 
resulting EXTRA_OECONF is the same, but I understand why this is 
conceptually wrong, I'll send a v2 in a bit.

Thanks!

Alejandro
>
> Ross
>


--------------23974A7BF6D3D3CD4A93ADEB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <div class="moz-cite-prefix">On 09/26/2017 12:25 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0Lb-RHGu+pPOb+Aa-i7DFi_YsvzuaTy7g8+zXDxOt8FXqg@mail.gmail.com">
      <div dir="ltr">On 26 September 2017 at 18:23, Alejandro Hernandez
        <span dir="ltr">&lt;<a
            href="mailto:alejandro.hernandez@linux.intel.com"
            target="_blank" moz-do-not-send="true">alejandro.hernandez@linux.intel.com</a>&gt;</span>
        wrote:<br>
        <div class="gmail_extra">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">
              <div bgcolor="#FFFFFF"> <span class="gmail-">
                  <blockquote type="cite">
                    <div dir="ltr">
                      <div class="gmail_extra">
                        <div class="gmail_quote">
                          <div>Using EXTRA_OECONF_append gets added to
                            the correct EXTRA_OECONF_class-&lt;target/<wbr>natve&gt;
                            correctly, otherwise its disregarded.<br>
                          </div>
                        </div>
                      </div>
                    </div>
                  </blockquote>
                </span></div>
            </blockquote>
            <div><br>
            </div>
            <div>I guess the subtext was</div>
            <div><br>
            </div>
            <span style="font-size:12.800000190734863px">+EXTRA_OECONF_class-native
              = "\</span><br style="font-size:12.800000190734863px">
            <span style="font-size:12.800000190734863px">+ 
              --enable-ipv6=${@bb.utils.</span><wbr
              style="font-size:12.800000190734863px"><span
              style="font-size:12.800000190734863px">contains('DISTRO_FEATURES_</span><wbr
              style="font-size:12.800000190734863px"><span
              style="font-size:12.800000190734863px">NATIVE', 'ipv6',
              'yes', 'no', d)} \</span><br
              style="font-size:12.800000190734863px">
            <div><br>
            </div>
            <div><br>
            </div>
            <div>That is totally wrong.  In a native recipe,
              DISTRO_FEATURES has been altered based on
              DISTRO_FEATURES_NATIVE.  You don't need to make other
              changes, and I suspect that reverting this chunk means the
              other chunks can also be reverted.</div>
          </div>
        </div>
      </div>
    </blockquote>
    I see your point, seems like I got confused, I just checked and the
    resulting EXTRA_OECONF is the same, but I understand why this is
    conceptually wrong, I'll send a v2 in a bit.<br>
    <br>
    Thanks!<br>
    <br>
    Alejandro<br>
    <blockquote type="cite"
cite="mid:CAJTo0Lb-RHGu+pPOb+Aa-i7DFi_YsvzuaTy7g8+zXDxOt8FXqg@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
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

--------------23974A7BF6D3D3CD4A93ADEB--
