Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 66D71601D4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 02:28:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7O2S5PU014678
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 23 Aug 2016 19:28:05 -0700
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 23 Aug 2016 19:28:04 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1471857211.git.kai.kang@windriver.com>
	<9e30df083af2d4888f3aa500a34e4f9663e21996.1471857211.git.kai.kang@windriver.com>
	<CAJTo0LZ+_JhV6L=NSgKaVGzWTjibuGzp0GhEANaa2Go=ASdf_A@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <57BD0633.7070204@windriver.com>
Date: Wed, 24 Aug 2016 10:28:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ+_JhV6L=NSgKaVGzWTjibuGzp0GhEANaa2Go=ASdf_A@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] openssh: fix CVE-2016-6515
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
X-List-Received-Date: Wed, 24 Aug 2016 02:28:08 -0000
Content-Type: multipart/alternative;
	boundary="------------070201050809080902030009"

--------------070201050809080902030009
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2016年08月24日 00:33, Burton, Ross wrote:
>
> On 23 August 2016 at 02:59, <kai.kang@windriver.com 
> <mailto:kai.kang@windriver.com>> wrote:
>
>     From: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>
>     Backport patch to fix CVE-2016-6515 from:
>
>     https://anongit.mindrot.org/openssh.git/commit/?id=fcd135c
>     <https://anongit.mindrot.org/openssh.git/commit/?id=fcd135c>
>
>
> We've already had an upgrade to 7.3 in master(-next), so this would 
> only be appropriate for the stable branches.

Yes, openssh 7.3p1 contains this patch. Thanks.

--Kai

>
> Ross


-- 
Regards,
Neil | Kai Kang


--------------070201050809080902030009
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 2016年08月24日 00:33, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LZ+_JhV6L=NSgKaVGzWTjibuGzp0GhEANaa2Go=ASdf_A@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 23 August 2016 at 02:59, <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:kai.kang@windriver.com" target="_blank">kai.kang@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":1hy" class="a3s aXjCH m156b5222ca2617c0">From:
                Kai Kang &lt;<a moz-do-not-send="true"
                  href="mailto:kai.kang@windriver.com">kai.kang@windriver.com</a>&gt;<br>
                <br>
                Backport patch to fix CVE-2016-6515 from:<br>
                <br>
                <a moz-do-not-send="true"
                  href="https://anongit.mindrot.org/openssh.git/commit/?id=fcd135c"
                  rel="noreferrer" target="_blank">https://anongit.mindrot.org/<wbr><span
                    class="il">openssh</span>.git/commit/?id=fcd135c</a></div>
            </blockquote>
          </div>
          <br>
          We've already had an upgrade to 7.3 in master(-next), so this
          would only be appropriate for the stable branches.</div>
      </div>
    </blockquote>
    <br>
    Yes, openssh 7.3p1 contains this patch. Thanks.<br>
    <br>
    --Kai<br>
    <br>
    <blockquote
cite="mid:CAJTo0LZ+_JhV6L=NSgKaVGzWTjibuGzp0GhEANaa2Go=ASdf_A@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
    <br>
    <pre class="moz-signature" cols="72">-- 
Regards,
Neil | Kai Kang</pre>
  </body>
</html>

--------------070201050809080902030009--
