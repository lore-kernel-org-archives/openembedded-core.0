Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 49F34782CC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 17:08:56 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id 61so2967087plf.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 09:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=rE6FawVaXJ6ivlorcVM9bsWxxjqDiBnZ1XzXBgM2wFQ=;
	b=S7uYVXq+PHTXzC5D4M/MRlftcTe3tIU6T9eNgE6HVxxilQqqeo78kcROvlfZhHD6aW
	S+RRNRdgV7pY4lRfGexlbSU7yYZC/Hg8BP2nZCFTrjslv+ak2l6KGZvASrSOmlUsj2Pi
	tvubsLI7HwnhMkxbn1BoV2hBz8AX0c6LpTY5qe//BlCqnQV/bBfWPPtGrdjKjCEx8eRb
	lgflwARma8ut9O9GZqr3g3DoLpsQ/ifZJ+lkN5a9fntj9yOguN6dHhLqpMXaPM8tb26k
	eG3BCye+C4S2YQRke1Fw5vXZhhdygrJluqp2yQCopcOCqOjIc4FyYTxY83BexSdUGH4n
	sPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=rE6FawVaXJ6ivlorcVM9bsWxxjqDiBnZ1XzXBgM2wFQ=;
	b=CMeWeWIMa1UswhwNhYIQ927gBFqrOiMyHVcg8MfPdgyQImL8G/3trGHrNh7BcsKgNb
	91Gpk5fD/hbP/leMdeJBB+Ggck/shChmzpuJ0xZetDk+27A2l/MnH+r0EwuYAk3r8wFC
	2eoyFC/oCdFOWFZW052BwxiffR49evpTRpcMsM3ms9H5YabndaGEdS8oAyDNlmDxqLKO
	QXKfg4nwKhkgGqMNb4rUEFjC8By8pGNMQ5j2S2MM+lKGZhQXm/vGc9L2WyQa1rd8PKHm
	LGm+1Pg0x7ZKnLLBaJJdUnnJz6fyl1axDtLia9JEPr+yN/z/pMV8cUqLn5BwL4uGLEcH
	Q6mw==
X-Gm-Message-State: AJaThX4oHP97nv+jo8ucz+xnzl9jaHxtvvaeix4HlcNS/E9EjIZZcGJX
	/+muezLTYmto52lLE5SGO/zm4g==
X-Google-Smtp-Source: AGs4zMbd1tfRP/LC9nDq+gVxfBqL3MYCEMVcYLTyl6sW9Dg6SlcSGJ9DXUp1dpFw+6FfZsZh2zvEpQ==
X-Received: by 10.159.218.76 with SMTP id x12mr22292785plv.285.1511456938025; 
	Thu, 23 Nov 2017 09:08:58 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:844b:1cda:e660:cce8?
	([2601:202:4001:9ea0:844b:1cda:e660:cce8])
	by smtp.gmail.com with ESMTPSA id
	l73sm9927744pfi.82.2017.11.23.09.08.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Nov 2017 09:08:57 -0800 (PST)
To: "Burton, Ross" <ross.burton@intel.com>, Armin Kuster <akuster808@gmail.com>
References: <cover.1511294278.git.akuster808@gmail.com>
	<1355ffaccf3da8419c4067047000b68c2f83cda6.1511294278.git.akuster808@gmail.com>
	<CAJTo0LY14hO2kvvCyF8WyB1bvEHGG6Cg_LQ7TmbphLDeU9GTxg@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <0f541e58-027e-cfd5-48c2-d85f228578f5@gmail.com>
Date: Thu, 23 Nov 2017 09:08:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY14hO2kvvCyF8WyB1bvEHGG6Cg_LQ7TmbphLDeU9GTxg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] nettle: update to 3.4 and cleanup
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
X-List-Received-Date: Thu, 23 Nov 2017 17:08:57 -0000
Content-Type: multipart/alternative;
	boundary="------------090129143FBC4AE5A2A6E54F"
Content-Language: en-US

--------------090129143FBC4AE5A2A6E54F
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 11/23/2017 09:07 AM, Burton, Ross wrote:
> On 21 November 2017 at 20:01, Armin Kuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>      SRC_URI = "http://www.lysator.liu.se/~nisse/archive/${BP}.tar.gz
>     <http://www.lysator.liu.se/%7Enisse/archive/$%7BBP%7D.tar.gz> \
>
>
> So I've just discovered that this server is sending broken HTTP
> headers and fetching this tarball doesn't work for anyone with wget
> 1.19.2.
>
> I've told the maintainer and changed the recipe to use the GNU mirror.
thanks
-armin
>
> Ross 


--------------090129143FBC4AE5A2A6E54F
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
    <div class="moz-cite-prefix">On 11/23/2017 09:07 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0LY14hO2kvvCyF8WyB1bvEHGG6Cg_LQ7TmbphLDeU9GTxg@mail.gmail.com">
      <div dir="ltr">On 21 November 2017 at 20:01, Armin Kuster <span
          dir="ltr">&lt;<a href="mailto:akuster808@gmail.com"
            target="_blank" moz-do-not-send="true">akuster808@gmail.com</a>&gt;</span>
        wrote:<br>
        <div class="gmail_extra">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex"> SRC_URI
              = "<a
                href="http://www.lysator.liu.se/%7Enisse/archive/$%7BBP%7D.tar.gz"
                rel="noreferrer" target="_blank" moz-do-not-send="true">http://www.lysator.liu.se/~<wbr>nisse/archive/${BP}.tar.gz</a>
              \<br>
            </blockquote>
            <div><br>
            </div>
            <div>So I've just discovered that this server is sending
              broken HTTP headers and fetching this tarball doesn't work
              for anyone with wget 1.19.2.</div>
            <div><br>
            </div>
            <div>I've told the maintainer and changed the recipe to use
              the GNU mirror.</div>
          </div>
        </div>
      </div>
    </blockquote>
    thanks<br>
    -armin<br>
    <blockquote type="cite"
cite="mid:CAJTo0LY14hO2kvvCyF8WyB1bvEHGG6Cg_LQ7TmbphLDeU9GTxg@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
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

--------------090129143FBC4AE5A2A6E54F--
