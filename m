Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 308926C0CE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2018 02:10:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wAC2AWgM019367
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 11 Nov 2018 18:10:32 -0800 (PST)
Received: from [128.224.162.232] (128.224.162.232) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Sun, 11 Nov 2018 18:10:25 -0800
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1541754618.git.hongxu.jia@windriver.com>
	<c54208078931ad047bd69fc38f27de2e2d367fbf.1541754618.git.hongxu.jia@windriver.com>
	<5c0fe7734469e010f42c6d14477928c4f6599447.camel@linuxfoundation.org>
	<a1a2bb6a-7ace-086c-e4f2-bd91f7b7d9b7@windriver.com>
	<2fd9b7ba-ca8e-fea4-c138-93f6f717f18d@windriver.com>
	<b4d475e75bf06b19dddc7ab34a93328d204d4673.camel@linuxfoundation.org>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <67a0f3d9-f454-5e9a-0583-de60c0acc3af@windriver.com>
Date: Mon, 12 Nov 2018 10:10:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <b4d475e75bf06b19dddc7ab34a93328d204d4673.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/2] rng-tools: 5 -> 6.6
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
X-List-Received-Date: Mon, 12 Nov 2018 02:10:33 -0000
Content-Type: multipart/alternative;
	boundary="------------1808C02140BFB1D9844F3095"
Content-Language: en-US

--------------1808C02140BFB1D9844F3095
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2018/11/11 下午6:18, richard.purdie@linuxfoundation.org wrote:
>> I am trying to catch the issue patches
> I dropped all the rng pieces from -next and the current build is
> looking a lot happier from a timeout perspective. It does seem to
> mainly affect x86, particularly the x32 target for some reason but its
> not exclusive to that.

The rng-tools is not installed to any image by default,

I curious why it affect run time test

//Hongxu


> Even if its kernel config or something like that, it still seems like
> its a regression to cause hangs when we didn't have any before...
>
> Cheers,
>
> Richard
>


--------------1808C02140BFB1D9844F3095
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2018/11/11 下午6:18,
      <a class="moz-txt-link-abbreviated" href="mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a> wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:b4d475e75bf06b19dddc7ab34a93328d204d4673.camel@linuxfoundation.org">
      <blockquote type="cite" style="color: #000000;">
        <pre class="moz-quote-pre" wrap="">I am trying to catch the issue patches
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">I dropped all the rng pieces from -next and the current build is
looking a lot happier from a timeout perspective. It does seem to
mainly affect x86, particularly the x32 target for some reason but its
not exclusive to that.
</pre>
    </blockquote>
    <p>The rng-tools is not installed to any image by default,</p>
    <p>I curious why it affect run time test</p>
    <p>//Hongxu<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:b4d475e75bf06b19dddc7ab34a93328d204d4673.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">
Even if its kernel config or something like that, it still seems like
its a regression to cause hangs when we didn't have any before...

Cheers,

Richard

</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------1808C02140BFB1D9844F3095--
