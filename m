Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 849DB65CC9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 09:19:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAB9J7GF006210
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Nov 2014 01:19:08 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 11 Nov 2014 01:19:07 -0800
Message-ID: <5461D488.1050304@windriver.com>
Date: Tue, 11 Nov 2014 17:19:04 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <cover.1415346812.git.hongxu.jia@windriver.com>
	<16384282a6c5f4878b1c377bbe38cfae1d311d0b.1415346812.git.hongxu.jia@windriver.com>
	<20141107143813.GF2444@jama>
	<01AE3AA2-1B18-4047-A760-E137E0A245D3@dominion.thruhere.net>
	<54601CC7.1060000@windriver.com> <20141110064247.GB2440@jama>
	<54606AD5.1050905@windriver.com>
	<3313D76B-7622-4F78-B550-E3BAD5910B4A@dominion.thruhere.net>
In-Reply-To: <3313D76B-7622-4F78-B550-E3BAD5910B4A@dominion.thruhere.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] avahi.inc: use avahi-daemon as avahi's provider
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
X-List-Received-Date: Tue, 11 Nov 2014 09:19:13 -0000
Content-Type: multipart/alternative;
	boundary="------------000902030207030902030407"

--------------000902030207030902030407
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/2014 05:02 PM, Koen Kooi wrote:
> It is not a bug when recipe foo.bb doesn't generate foo.ipk. Your changes introduce needless churn and break upgrade paths only to cater to people making wrong assumptions.

Except on purpose to not generate recipe_name package, the other
situation is indeed a bug, such as ssmping and pimd, it don't generate
any package at all.

http://cgit.openembedded.org/meta-openembedded/commit/?id=4b6970c24c3fb0926fd700678c0e11de43a5bf92
http://cgit.openembedded.org/meta-openembedded/commit/?id=c5398fc0fe246e4828c9e950f779f437266bfaa1

If the "Your chagnes" means add checking about the non-create
package, I think you are right, many recipe don't want generate
recipe_name package on purpose, we should avoid that noisy
warning, maybe we should add a script to do that on the result of
world build.

But if the "Your chagnes" means the above fix, I think these fixes is
reasonable for users, especially for newbies. (Actually the issues
were reported by our customer)

//Hongxu


--------------000902030207030902030407
Content-Type: text/html; charset="windows-1252"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 11/11/2014 05:02 PM, Koen Kooi
      wrote:<br>
    </div>
    <blockquote
      cite="mid:3313D76B-7622-4F78-B550-E3BAD5910B4A@dominion.thruhere.net"
      type="cite">
      <pre wrap="">It is not a bug when recipe foo.bb doesn't generate foo.ipk. Your changes introduce needless churn and break upgrade paths only to cater to people making wrong assumptions.</pre>
    </blockquote>
    <br>
    Except on purpose to not generate recipe_name package, the other<br>
    situation is indeed a bug, such as
    <meta http-equiv="content-type" content="text/html;
      charset=windows-1252">
    <meta http-equiv="content-type" content="text/html;
      charset=windows-1252">
    ssmping and pimd, it don't generate<br>
    any package at all.<br>
    <br>
<a class="moz-txt-link-freetext" href="http://cgit.openembedded.org/meta-openembedded/commit/?id=4b6970c24c3fb0926fd700678c0e11de43a5bf92">http://cgit.openembedded.org/meta-openembedded/commit/?id=4b6970c24c3fb0926fd700678c0e11de43a5bf92</a><br>
<a class="moz-txt-link-freetext" href="http://cgit.openembedded.org/meta-openembedded/commit/?id=c5398fc0fe246e4828c9e950f779f437266bfaa1">http://cgit.openembedded.org/meta-openembedded/commit/?id=c5398fc0fe246e4828c9e950f779f437266bfaa1</a><br>
    <br>
    If the "Your chagnes" means add checking about the non-create<br>
    package, I think you are right, many recipe don't want generate<br>
    recipe_name package on purpose, we should avoid that noisy<br>
    warning, maybe we should add a script to do that on the result of<br>
    world build.<br>
    <br>
    But if the "Your chagnes" means the above fix, I think these fixes
    is<br>
    reasonable for users, especially for newbies. (Actually the issues<br>
    were reported by our customer)<br>
    <br>
    //Hongxu<br>
    <br>
  </body>
</html>

--------------000902030207030902030407--
