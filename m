Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id BB9447833D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 01:19:52 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id l188so4733878pfc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Sep 2017 18:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language;
	bh=ktwccK1IXST/nsa8HkxYRHJQVBHCoqFe3fcIKPZmE78=;
	b=TliQ/eO2v8DJ4F+eVBXGFqIaxI1SPsgPvwXjzpKuKOydOdpQkj/Uu5SUmP3z810Zmo
	7pvVRHeYZ/ittn9bjQ5iqznLNjdLa5llQr4g8hSkiR1pEc5oN0BYSk8XP1/lfy5iplZp
	LsWwnUZVtMBkYE4bfaAi1qo1rrHMZAZQuBuz82F83QnLCloTtfRMrL5QhYDWC/ZQKlMn
	Al5Xji3dgy33QoCrbC6yTFjk0ne/KXVrNtj7o7fPXZSLhnRWI8KHujFq0TD+1yoTdTPM
	sPns66iIM5z8TUfilXP9DFP7gzS3AO9f7tyfqqDQ9+j521wS1iPibf5I/o2oQEgO+hsd
	njZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=ktwccK1IXST/nsa8HkxYRHJQVBHCoqFe3fcIKPZmE78=;
	b=arKJZaGRBTxV16WSBXlWlcKxd/VbJYvN8K/PqISW/NBnrefvF4LlijqDV4OxQF1qTY
	OgPKcB8sD8sE1pMFbK7K6V45USUg1s1H5X91imTINYFYs11T6bQPpIpkIElOd8iZ2kze
	PXGYzqj16+53L0trXnW+W5sXAAnUu9nLprGyr01020Z0LQiDLiLklV0CqOhvMZDCZBvb
	40rhGdJC+khj/ImHjNXYU1XVc73xpHJPvWZ8Ok5s97d9HxPYZigqWNGanV1QmClKk2cM
	LObGFZj++aFGhw0ln2ZzluHcmNA1DCqP1qG34roq6k3ztfXCxXiNtkosmRUU9IJrNBkW
	HLzQ==
X-Gm-Message-State: AHPjjUgyPpG5lsqPE9VWdTVH9fc1MHwzcWWaFJddbE6Ty7zD3040nmez
	xVJpbZj5miu+v7Z2kE6uiVVNBg==
X-Google-Smtp-Source: AOwi7QABxhs9AsxXeoE7PvAsDYp6LZoH8Siiw2Lcsoai7OUDaNRR1jAjZsPc10/IRlWTO+uORB+ASA==
X-Received: by 10.99.126.84 with SMTP id o20mr9427441pgn.139.1506388794068;
	Mon, 25 Sep 2017 18:19:54 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:41ca:f424:3692:4c93?
	([2601:202:4001:9ea0:41ca:f424:3692:4c93])
	by smtp.gmail.com with ESMTPSA id
	b79sm13735207pfd.37.2017.09.25.18.19.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Sep 2017 18:19:53 -0700 (PDT)
To: Gerson Fernando Budke <nandojve@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <CABOv41PKzw5yOoS+-LYCNFuAR0Nh1Q0Acv3rhFpjDYDnBtu2qw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <992ef94b-ebd6-70c0-2e86-d3c70bc7e588@gmail.com>
Date: Mon, 25 Sep 2017 18:19:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CABOv41PKzw5yOoS+-LYCNFuAR0Nh1Q0Acv3rhFpjDYDnBtu2qw@mail.gmail.com>
Subject: Re: [morty][PATCH] image.bbclass: Sorted ctypes to avoid basehash error
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
X-List-Received-Date: Tue, 26 Sep 2017 01:19:52 -0000
Content-Type: multipart/alternative;
	boundary="------------47B23FBBB5E1E9183C1504A1"
Content-Language: en-US

--------------47B23FBBB5E1E9183C1504A1
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 09/22/2017 03:30 AM, Gerson Fernando Budke wrote:
> When selected multiple subimages a similar error could happend:
>   Variable do_image_cpio[subimages] value changed \
>     from 'cpio.gz.u-boot cpio.gz' to 'cpio.gz cpio.gz.u-boot'
> To avoid this, 'ctypes' should be sorted at 'gen_conversion_cmds'.
>
> This garantee that 'CONVERSION_CMD_xxx' are always written in tha same
> order and consequently 'do_image_cpio' have the same hash.
>
> (From OE-Core rev: 271f1a5f65b8685a1e3645026876251122ef3974)

This is in morty,
thanks,
Armin
>
> Signed-off-by: Gerson Fernando Budke <nandojve@gmail.com
> <mailto:nandojve@gmail.com>>
> Signed-off-by: Ross Burton <ross.burton@intel.com
> <mailto:ross.burton@intel.com>>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
> <mailto:richard.purdie@linuxfoundation.org>>
> ---
>  meta/classes/image.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index ef2b38aeaf..9c9f14a99a 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -453,7 +453,7 @@ python () {
>
>          rm_tmp_images = set()
>          def gen_conversion_cmds(bt):
> -            for ctype in ctypes:
> +            for ctype in sorted(ctypes):
>                  if bt.endswith("." + ctype):
>                      type = bt[0:-len(ctype) - 1]
>                      if type.startswith("debugfs_"):
>
>
>


--------------47B23FBBB5E1E9183C1504A1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 09/22/2017 03:30 AM, Gerson Fernando
      Budke wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CABOv41PKzw5yOoS+-LYCNFuAR0Nh1Q0Acv3rhFpjDYDnBtu2qw@mail.gmail.com">
      <div dir="ltr"><span style="font-size:12.8px">When selected
          multiple subimages a similar error could happend:</span><br
          style="font-size:12.8px">
        <span style="font-size:12.8px">  Variable
          do_image_cpio[subimages] value changed \</span><br
          style="font-size:12.8px">
        <span style="font-size:12.8px">    from 'cpio.gz.u-boot cpio.gz'
          to 'cpio.gz cpio.gz.u-boot'</span><br style="font-size:12.8px">
        <span style="font-size:12.8px">To avoid this, 'ctypes' should be
          sorted at 'gen_conversion_cmds'.</span><br
          style="font-size:12.8px">
        <br style="font-size:12.8px">
        <span style="font-size:12.8px">This garantee that
          'CONVERSION_CMD_xxx' are always written in tha same</span><br
          style="font-size:12.8px">
        <span style="font-size:12.8px">order and consequently
          'do_image_cpio' have the same hash.</span><br
          style="font-size:12.8px">
        <br style="font-size:12.8px">
        <span style="font-size:12.8px">(From OE-Core rev:
          271f1a5f65b8685a1e364502687625</span><wbr
          style="font-size:12.8px"><span style="font-size:12.8px">1122ef3974)</span><br
          style="font-size:12.8px">
      </div>
    </blockquote>
    <br>
    This is in morty,<br>
    thanks,<br>
    Armin<br>
    <blockquote type="cite"
cite="mid:CABOv41PKzw5yOoS+-LYCNFuAR0Nh1Q0Acv3rhFpjDYDnBtu2qw@mail.gmail.com">
      <div dir="ltr"><br style="font-size:12.8px">
        <span style="font-size:12.8px">Signed-off-by: Gerson Fernando
          Budke &lt;</span><a href="mailto:nandojve@gmail.com"
          style="font-size:12.8px" moz-do-not-send="true">nandojve@gmail.com</a><span
          style="font-size:12.8px">&gt;</span><br
          style="font-size:12.8px">
        <span style="font-size:12.8px">Signed-off-by: Ross Burton &lt;</span><a
          href="mailto:ross.burton@intel.com" style="font-size:12.8px"
          moz-do-not-send="true">ross.burton@intel.com</a><span
          style="font-size:12.8px">&gt;</span><br
          style="font-size:12.8px">
        <span style="font-size:12.8px">Signed-off-by: Richard Purdie
          &lt;</span><a href="mailto:richard.purdie@linuxfoundation.org"
          style="font-size:12.8px" moz-do-not-send="true">richard.purdie@<wbr>linuxfoundation.org</a><span
          style="font-size:12.8px">&gt;</span><br
          style="font-size:12.8px">
        <span style="font-size:12.8px">---</span><br
          style="font-size:12.8px">
        <span style="font-size:12.8px"> meta/classes/image.bbclass | 2
          +-</span><br style="font-size:12.8px">
        <span style="font-size:12.8px"> 1 file changed, 1 insertion(+),
          1 deletion(-)</span><br style="font-size:12.8px">
        <br style="font-size:12.8px">
        <span style="font-size:12.8px">diff --git
          a/meta/classes/image.bbclass b/meta/classes/image.bbclass</span><br
          style="font-size:12.8px">
        <span style="font-size:12.8px">index ef2b38aeaf..9c9f14a99a
          100644</span><br style="font-size:12.8px">
        <span style="font-size:12.8px">--- a/meta/classes/image.bbclass</span><br
          style="font-size:12.8px">
        <span style="font-size:12.8px">+++ b/meta/classes/image.bbclass</span><br
          style="font-size:12.8px">
        <span style="font-size:12.8px">@@ -453,7 +453,7 @@ python () {</span><br
          style="font-size:12.8px">
        <br style="font-size:12.8px">
        <span style="font-size:12.8px">         rm_tmp_images = set()</span><br
          style="font-size:12.8px">
        <span style="font-size:12.8px">         def
          gen_conversion_cmds(bt):</span><br style="font-size:12.8px">
        <span style="font-size:12.8px">-            for ctype in ctypes:</span><br
          style="font-size:12.8px">
        <span style="font-size:12.8px">+            for ctype in
          sorted(ctypes):</span><br style="font-size:12.8px">
        <span style="font-size:12.8px">                 if
          bt.endswith("." + ctype):</span><br style="font-size:12.8px">
        <span style="font-size:12.8px">                     type =
          bt[0:-len(ctype) - 1]</span><br style="font-size:12.8px">
        <span style="font-size:12.8px">                     if
          type.startswith("debugfs_"):</span>
        <div class="gmail-yj6qo gmail-ajU" style="margin:2px 0px
          0px;font-size:12.8px">
          <div id="gmail-:95h" class="gmail-ajR" tabindex="0"><br>
          </div>
        </div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------47B23FBBB5E1E9183C1504A1--
