Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CF81E6FF3D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 10:01:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0PA1006014298
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 25 Jan 2016 02:01:01 -0800 (PST)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 25 Jan 2016 02:01:00 -0800
To: "Burton, Ross" <ross.burton@intel.com>, Khem Raj <raj.khem@gmail.com>
References: <cover.1453703961.git.kai.kang@windriver.com>
	<51f0a96271229055e28dfe5ab12a29559c474614.1453703961.git.kai.kang@windriver.com>
	<CAMKF1sohABk==LdOMgph7JyHaTH2B0-=5ODtFy49-BJHbcM4Lg@mail.gmail.com>
	<CAJTo0LYrOjAaOALMkon02aJNrDL43dNgJ6s2G=aPhtejodQwMA@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <56A5F267.3090608@windriver.com>
Date: Mon, 25 Jan 2016 18:01:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYrOjAaOALMkon02aJNrDL43dNgJ6s2G=aPhtejodQwMA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] wget: inherit perlnative
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
X-List-Received-Date: Mon, 25 Jan 2016 10:01:03 -0000
Content-Type: multipart/alternative;
	boundary="------------030204060408090701020206"

--------------030204060408090701020206
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2016年01月25日 16:48, Burton, Ross wrote:
>
> On 25 January 2016 at 07:27, Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
>
>     what happens for wget-native ? Does it now serialize the build ?
>
>
> Thankfully wget-native is an assumed dependency (albeit not 
> explicitly, we should fix that).
>
> But I do agree that perlnative is a *huge* dependency for a bit of 
> documentation.  SLED 11 is rather old now (released 2009), we don't 
> test it on the autobuilders, and support for it ends in less than two 
> months.  I'd prefer to either call this a distro patch for products 
> who want to continue to support SLED11, or patch the documentation 
> build so that it doesn't pass --utf8 if that isn't harmful.

If oe-core doesn't support SLED11, I'll make this as a local commit. 
When the support for SLED11 ends, it could be removed easily.

Thank you all.

--Kai


>
> Ross


-- 
Regards,
Neil | Kai Kang


--------------030204060408090701020206
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2016年01月25日 16:48, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LYrOjAaOALMkon02aJNrDL43dNgJ6s2G=aPhtejodQwMA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 25 January 2016 at 07:27, Khem Raj
            <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:raj.khem@gmail.com" target="_blank">raj.khem@gmail.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":12yt" class="a3s" style="overflow:hidden">what
                happens for wget-native ? Does it now serialize the
                build ?</div>
            </blockquote>
            <div><br>
            </div>
            <div>Thankfully wget-native is an assumed dependency (albeit
              not explicitly, we should fix that).</div>
            <div><br>
            </div>
            <div>But I do agree that perlnative is a *huge* dependency
              for a bit of documentation.  SLED 11 is rather old now
              (released 2009), we don't test it on the autobuilders, and
              support for it ends in less than two months.  I'd prefer
              to either call this a distro patch for products who want
              to continue to support SLED11, or patch the documentation
              build so that it doesn't pass --utf8 if that isn't
              harmful.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    If oe-core doesn't support SLED11, I'll make this as a local commit.
    When the support for SLED11 ends, it could be removed easily.<br>
    <br>
    Thank you all.<br>
    <br>
    --Kai<br>
    <br>
    <br>
    <blockquote
cite="mid:CAJTo0LYrOjAaOALMkon02aJNrDL43dNgJ6s2G=aPhtejodQwMA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div><br>
            </div>
            <div>Ross</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    <br>
    <pre class="moz-signature" cols="72">-- 
Regards,
Neil | Kai Kang</pre>
  </body>
</html>

--------------030204060408090701020206--
