Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8A65B6010D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 21:43:38 +0000 (UTC)
Received: by lfdl133 with SMTP id l133so39661333lfd.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 13:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type;
	bh=e3zb4kP0Hd+cODnXJfA5Gr+qoyKFJbwM0JLH7xjd5zU=;
	b=T9ShOeik1VECYhulCTgUY3CKAXw/U1XaWCu0iArcO5cD4zSTmz+kyyhwYHtkCzVSTC
	QfbXi2rcZr0k1005lNlV4ddleCADXQjgNTJL3b07G/ix87YMtSWRfTW6DVhfp6tslYlR
	Cl+lrQFuwDyNq6mb44mDa6yWkx1W++E5KSeHdDCihANtbboEk4ll7587NuWE60fsrpp1
	vcDNznOLzEeP3nNYD9v8TKRo5QtBmq2smfSHS6CgdHkJz0w3VfQ2ewm9woxjyNE1DZwc
	cXtHAwKpxJHmb/GbH/vBL8SGIfHa2ALkNxiBM7LorqLPBahDMy4dXyiscj/al6cgnpoX
	Cyxg==
X-Received: by 10.112.53.167 with SMTP id c7mr12039739lbp.20.1448315018432;
	Mon, 23 Nov 2015 13:43:38 -0800 (PST)
Received: from [192.168.0.12] (c80-217-62-231.bredband.comhem.se.
	[80.217.62.231]) by smtp.gmail.com with ESMTPSA id
	b13sm2150311lfb.30.2015.11.23.13.43.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Nov 2015 13:43:37 -0800 (PST)
Message-ID: <56538888.3060200@gmail.com>
Date: Mon, 23 Nov 2015 22:43:36 +0100
From: Ming Liu <liu.ming50@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1448271748-3210-1-git-send-email-liu.ming50@gmail.com>
	<CAJTo0LZOKv0S2-JAb_6goEt6OUetxyB3C24FZpVQyv+RKExTEQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZOKv0S2-JAb_6goEt6OUetxyB3C24FZpVQyv+RKExTEQ@mail.gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v1] initscripts: do not save timestamp for readonly system
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
X-List-Received-Date: Mon, 23 Nov 2015 21:43:38 -0000
Content-Type: multipart/alternative;
	boundary="------------010901030806030108060804"

--------------010901030806030108060804
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/23/2015 10:18 PM, Burton, Ross wrote:
>
> On 23 November 2015 at 09:42, Ming Liu <liu.ming50@gmail.com 
> <mailto:liu.ming50@gmail.com>> wrote:
>
>     +[ -w /etc/timestamp ] && date -u +%4Y%2m%2d%2H%2M%2S > /etc/timestamp
>
>
> This would fail if /etc/timestamp doesn't already exist.  I'm tempted 
> to say you should just 2>/dev/null so it tries and the error is hidden 
> in case /etc/timestamp is deleted on a writable file system.
Yes, that is true! I did not consider that case, then I will send a V2 soon.

//Ming Liu
>
> Ross


--------------010901030806030108060804
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <br>
    <div class="moz-cite-prefix">On 11/23/2015 10:18 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LZOKv0S2-JAb_6goEt6OUetxyB3C24FZpVQyv+RKExTEQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 23 November 2015 at 09:42, Ming
            Liu <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:liu.ming50@gmail.com" target="_blank">liu.ming50@gmail.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":2gp" class="a3s" style="overflow:hidden">+[ -w
                /etc/timestamp ] &amp;&amp; date -u +%4Y%2m%2d%2H%2M%2S
                &gt; /etc/timestamp</div>
            </blockquote>
            <div><br>
            </div>
            <div>This would fail if /etc/timestamp doesn't already
              exist.  I'm tempted to say you should just 2&gt;/dev/null
              so it tries and the error is hidden in case /etc/timestamp
              is deleted on a writable file system.</div>
          </div>
        </div>
      </div>
    </blockquote>
    Yes, that is true! I did not consider that case, then I will send a
    V2 soon.<br>
    <br>
    //Ming Liu<br>
    <blockquote
cite="mid:CAJTo0LZOKv0S2-JAb_6goEt6OUetxyB3C24FZpVQyv+RKExTEQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div><br>
            </div>
            <div>Ross <br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------010901030806030108060804--
