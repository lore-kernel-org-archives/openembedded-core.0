Return-Path: <net147@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6035973ADB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 12:37:15 +0000 (UTC)
Received: by pdbnh10 with SMTP id nh10so10968789pdb.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 05:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type;
	bh=AHgnHK3FBHnHN72FJnGPCp3Ut7bkr2wYJJwVMyHy/0I=;
	b=epS3hMuc7UGbJLD1P2UnNb7LweKQn6C8vA6Z5GRQbuGLw+S7+HQxbt5zb6UPpwS6Gx
	n6kX9VFS/wH+UN3/UyV7zozZeYlubB7IFOOy70BTMXmnpzsvgZH202JYntzpQTy5REgY
	NQmgBsV28CYElTkXjcBQgMNk5mbvyP0QBoNqvx+2qxh3MOP5a7w+Di9qWW9acPXtQBEn
	qUhwTA0peYVtIW5dtFr2RwSXKjG30LBJcELK3zmpL07o9gUXGKsROEBMdtgTJ3TxvoHl
	Pwu0j1y90BS8XwJOWCYKRE4BvSIsrsgLDzDYMVxzRs9m80LQCSVEKMxomxilbqyfLdw/
	w5UA==
X-Received: by 10.66.121.161 with SMTP id ll1mr41432000pab.131.1426077437111; 
	Wed, 11 Mar 2015 05:37:17 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id pu9sm5933024pdb.49.2015.03.11.05.37.14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Mar 2015 05:37:16 -0700 (PDT)
Message-ID: <550036F5.8030004@gmail.com>
Date: Wed, 11 Mar 2015 23:37:09 +1100
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1426057202-17789-1-git-send-email-net147@gmail.com>
	<CAJTo0LbQA+cRhkjR07cYLA22=tbqqsukfCFCKbOaA1Janpc+og@mail.gmail.com>
In-Reply-To: <CAJTo0LbQA+cRhkjR07cYLA22=tbqqsukfCFCKbOaA1Janpc+og@mail.gmail.com>
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
X-List-Received-Date: Wed, 11 Mar 2015 12:37:17 -0000
Content-Type: multipart/alternative;
	boundary="------------090600000107050707030407"

--------------090600000107050707030407
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/03/2015 11:31 PM, Burton, Ross wrote:
> On 11 March 2015 at 07:00, Jonathan Liu <net147@gmail.com 
> <mailto:net147@gmail.com>> wrote:
>
>     This avoids util-linux-fdisk pulling in util-linux and all the
>     associated sub-packages.
>
>
> util-linux is splitting so many packages and adding sub-packages so 
> frequently, could we just do this dynamically?
>
> Ross
Perhaps. I don't have experience in that area.

Regards,
Jonathan

--------------090600000107050707030407
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 11/03/2015 11:31 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LbQA+cRhkjR07cYLA22=tbqqsukfCFCKbOaA1Janpc+og@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">On 11 March 2015 at 07:00, Jonathan
            Liu <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:net147@gmail.com" target="_blank">net147@gmail.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">This
              avoids util-linux-fdisk pulling in util-linux and all the<br>
              associated sub-packages.<br>
            </blockquote>
            <div><br>
            </div>
            <div>util-linux is splitting so many packages and adding
              sub-packages so frequently, could we just do this
              dynamically? <br>
            </div>
            <div><br>
            </div>
            <div>Ross</div>
          </div>
        </div>
      </div>
    </blockquote>
    Perhaps. I don't have experience in that area.<br>
    <br>
    Regards,<br>
    Jonathan<br>
  </body>
</html>

--------------090600000107050707030407--
