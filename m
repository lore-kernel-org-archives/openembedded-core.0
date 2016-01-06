Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5A1C560761
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 02:33:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u062XR74027983
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 Jan 2016 18:33:28 -0800 (PST)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 5 Jan 2016 18:33:26 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1451382094.git.kai.kang@windriver.com>
	<c46aeee4002b37e3f84433f78cbb82278e5d066e.1451382094.git.kai.kang@windriver.com>
	<CAJTo0LYN-Lpq=y3fcyYCAFPCZVuRrbTv+ALL2ytT_tQsmoa8Mw@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <568C7CFC.2080206@windriver.com>
Date: Wed, 6 Jan 2016 10:33:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYN-Lpq=y3fcyYCAFPCZVuRrbTv+ALL2ytT_tQsmoa8Mw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Revert "glib-2.0: build dependency cleanup"
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
X-List-Received-Date: Wed, 06 Jan 2016 02:33:29 -0000
Content-Type: multipart/alternative;
	boundary="------------050803000905090001050209"

--------------050803000905090001050209
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2016年01月04日 18:47, Burton, Ross wrote:
>
> On 29 December 2015 at 09:43, <kai.kang@windriver.com 
> <mailto:kai.kang@windriver.com>> wrote:
>
>     This reverts commit fcd7494b347423185c883b2897c4908929843a71.
>
>
> Why revert?  Just adding glib-2.0-native to DEPENDS is sufficient, no 
> need to revert the other improvements in that commit.
>
> Ross

It also needs to be removed from DEPENDS_append. I didn't build for 
nativesdk, but I suppose glib-2.0-native  is required too.

-- 
Regards,
Neil | Kai Kang


--------------050803000905090001050209
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2016年01月04日 18:47, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LYN-Lpq=y3fcyYCAFPCZVuRrbTv+ALL2ytT_tQsmoa8Mw@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 29 December 2015 at 09:43, <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:kai.kang@windriver.com" target="_blank">kai.kang@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":1dg" class="a3s" style="overflow:hidden">This
                reverts commit fcd7494b347423185c883b2897c4908929843a71.<br>
              </div>
            </blockquote>
          </div>
          <br>
          Why revert?  Just adding glib-2.0-native to DEPENDS is
          sufficient, no need to revert the other improvements in that
          commit.</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
    It also needs to be removed from DEPENDS_append. I didn't build for
    nativesdk, but I suppose glib-2.0-native  is required too.<br>
    <br>
    <pre class="moz-signature" cols="72">-- 
Regards,
Neil | Kai Kang</pre>
  </body>
</html>

--------------050803000905090001050209--
