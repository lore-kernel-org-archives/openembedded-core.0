Return-Path: <net147@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2DAB673AE8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 12:56:08 +0000 (UTC)
Received: by pabli10 with SMTP id li10so11191871pab.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 05:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type;
	bh=d+abII1GO3n80mZvYvIzlnxcxt+1WUEa9LQEW/Ug45k=;
	b=wG69VZzwbQGQvNw8bl6Q+FhTs7683rFttfhgP6DoohTfzKCcW0mDujMe+9r1VtyRAx
	ZtbuolmvmFLalbPhDOH6QiMvN7XpdNWMb8IL8wpPgndxHTQcOmTd4z5oI8sZNVXa/edy
	RjDjkKSwmvTdMviwZcs2fogIJyuAEp8I7CLnsW4AFHnXF9ODH/U9ZZN7C9Qr11s3lwE2
	sQQihZbqMTcumbCCPqDH5LFCOt0r2HqiBewDU86nQZJWg4C1Oa3cdn2i124df4OGevCf
	Xr/XNSOxTYfYbKFDZrIcuFa47laDMb1hyqE0W5w/4AGWSDOUcBdgZUgm3UelCWOj9YGP
	+CPg==
X-Received: by 10.66.216.136 with SMTP id oq8mr25827015pac.20.1426078570069;
	Wed, 11 Mar 2015 05:56:10 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id om6sm6039148pdb.40.2015.03.11.05.56.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Mar 2015 05:56:09 -0700 (PDT)
Message-ID: <55003B62.8010509@gmail.com>
Date: Wed, 11 Mar 2015 23:56:02 +1100
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1426057202-17789-1-git-send-email-net147@gmail.com>
	<CAJTo0LbQA+cRhkjR07cYLA22=tbqqsukfCFCKbOaA1Janpc+og@mail.gmail.com>
	<550036F5.8030004@gmail.com>
	<CAJTo0La4E4u_sG32qYY4gBQG5NvgEYOshKPKRquHeR+ZJfbZkw@mail.gmail.com>
In-Reply-To: <CAJTo0La4E4u_sG32qYY4gBQG5NvgEYOshKPKRquHeR+ZJfbZkw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux: split libsmartcols into separate sub-package
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
X-List-Received-Date: Wed, 11 Mar 2015 12:56:12 -0000
Content-Type: multipart/alternative;
	boundary="------------090400080203010206020002"

--------------090400080203010206020002
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/03/2015 11:55 PM, Burton, Ross wrote:
>
> On 11 March 2015 at 12:37, Jonathan Liu <net147@gmail.com 
> <mailto:net147@gmail.com>> wrote:
>
>     Perhaps. I don't have experience in that area.
>
>
> Just done it, will send the patch once I've eaten lunch.
>
> Ross
Thanks.

Regards,
Jonathan

--------------090400080203010206020002
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 11/03/2015 11:55 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0La4E4u_sG32qYY4gBQG5NvgEYOshKPKRquHeR+ZJfbZkw@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 11 March 2015 at 12:37, Jonathan
            Liu <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:net147@gmail.com" target="_blank">net147@gmail.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div bgcolor="#FFFFFF" text="#000000">Perhaps. I don't
                have experience in that area.<br>
              </div>
            </blockquote>
          </div>
          <br>
          Just done it, will send the patch once I've eaten lunch. </div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    Thanks.<br>
    <br>
    Regards,<br>
    Jonathan<br>
  </body>
</html>

--------------090400080203010206020002--
