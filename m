Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3C3B460191
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 01:57:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v661vBFv009674
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Jul 2017 18:57:11 -0700 (PDT)
Received: from [128.224.162.212] (128.224.162.212) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 5 Jul 2017 18:57:10 -0700
To: "Burton, Ross" <ross.burton@intel.com>, Khem Raj <raj.khem@gmail.com>
References: <cover.1499241206.git.kai.kang@windriver.com>
	<CAMKF1sospBU00Y4RhShOavZm=eYxrzFXDOhA8JHeiRAvqxnkKQ@mail.gmail.com>
	<CAJTo0LZryGcQvFq373ix5VHBrjP5NDzL8-onaX2_s0GnO_m6SQ@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <808de61d-e3d8-a7e9-1e2d-bd89a6932717@windriver.com>
Date: Thu, 6 Jul 2017 10:00:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZryGcQvFq373ix5VHBrjP5NDzL8-onaX2_s0GnO_m6SQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Introduce a distro feature openssl-no-weak-ciphers
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
X-List-Received-Date: Thu, 06 Jul 2017 01:57:14 -0000
Content-Type: multipart/alternative;
	boundary="------------C2DC23FB3B75A85750EC6FB1"
Content-Language: en-US

--------------C2DC23FB3B75A85750EC6FB1
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2017年07月05日 23:15, Burton, Ross wrote:
>
> On 5 July 2017 at 15:38, Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
>
>     It's probably more appropriate to pin it at recipe level may be
>     via package config OpenSSL is not universal and some may even
>     avoid it completely
>
>
> Agreed, whilst I'm not against adding options for enabling insecure 
> ciphers (verses just disabling them), I don't think they deserve a 
> DISTRO_FEATURE of their own.

The problem is that packages depend on openssl don't know whether the 
cipher they need is disabled or not, so add such a DISTRO_FEATURE to 
sync openssl and packages depends on it.
I did it by a var before, but it looks not be a so official way.


Thanks,
Kai


>
> Ross


-- 
Regards,
Neil | Kai Kang


--------------C2DC23FB3B75A85750EC6FB1
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2017年07月05日 23:15, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0LZryGcQvFq373ix5VHBrjP5NDzL8-onaX2_s0GnO_m6SQ@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 5 July 2017 at 15:38, Khem Raj <span
              dir="ltr">&lt;<a href="mailto:raj.khem@gmail.com"
                target="_blank" moz-do-not-send="true">raj.khem@gmail.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div dir="auto">It's probably more appropriate to pin it
                at recipe level may be via package config OpenSSL is not
                universal and some may even avoid it completely</div>
              <span class=""></span></blockquote>
          </div>
          <br>
          Agreed, whilst I'm not against adding options for enabling
          insecure ciphers (verses just disabling them), I don't think
          they deserve a DISTRO_FEATURE of their own.</div>
      </div>
    </blockquote>
    <br>
    The problem is that packages depend on openssl don't know whether
    the cipher they need is disabled or not, so add such a
    DISTRO_FEATURE to sync openssl and packages depends on it.<br>
    I did it by a var before, but it looks not be a so official way.<br>
    <br>
    <br>
    Thanks,<br>
    Kai<br>
    <br>
    <br>
    <blockquote type="cite"
cite="mid:CAJTo0LZryGcQvFq373ix5VHBrjP5NDzL8-onaX2_s0GnO_m6SQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Regards,
Neil | Kai Kang</pre>
  </body>
</html>

--------------C2DC23FB3B75A85750EC6FB1--
