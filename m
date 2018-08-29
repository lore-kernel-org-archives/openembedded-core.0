Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E7569771B1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 09:21:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7T9LDXV018642
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 29 Aug 2018 02:21:13 -0700 (PDT)
Received: from [128.224.162.202] (128.224.162.202) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 29 Aug 2018 02:21:12 -0700
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1535533498-36841-1-git-send-email-hongxu.jia@windriver.com>
	<1535533498-36841-2-git-send-email-hongxu.jia@windriver.com>
	<dcef97cf1a06461aabe990674fd25bd9@XBOX02.axis.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <7519fb76-4424-9904-e87a-8dc1dc5746e3@windriver.com>
Date: Wed, 29 Aug 2018 17:21:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <dcef97cf1a06461aabe990674fd25bd9@XBOX02.axis.com>
Subject: Re: [PATCH 2/2] security_flags.inc: add var-FSTACK_PROTECTOR to improve variable OVERRIDES
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
X-List-Received-Date: Wed, 29 Aug 2018 09:21:15 -0000
Content-Type: multipart/alternative;
	boundary="------------0A06E9A43D7BB95CBEF4C79A"
Content-Language: en-US

--------------0A06E9A43D7BB95CBEF4C79A
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2018年08月29日 17:18, Peter Kjellerstedt wrote:
>> -SECURITY_CFLAGS ?= "-fstack-protector-strong ${SECURITY_PIE_CFLAGS} ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
>> -SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-strong ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
>> +FSTACK_PROTECTOR ?= "-fstack-protector-strong"
> May I suggest to call it SECURITY_STACK_PROTECTOR instead? That aligns
> it better with the other variables.
>
I am no objection on it, after collection the reply, I

will send V2 to tweak it

//Hongxu


--------------0A06E9A43D7BB95CBEF4C79A
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2018年08月29日 17:18, Peter
      Kjellerstedt wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:dcef97cf1a06461aabe990674fd25bd9@XBOX02.axis.com">
      <blockquote type="cite" style="color: #000000;">
        <pre wrap="">-SECURITY_CFLAGS ?= "-fstack-protector-strong ${SECURITY_PIE_CFLAGS} ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
-SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-strong ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
+FSTACK_PROTECTOR ?= "-fstack-protector-strong"
</pre>
      </blockquote>
      <pre wrap="">May I suggest to call it SECURITY_STACK_PROTECTOR instead? That aligns 
it better with the other variables.

</pre>
    </blockquote>
    <p>I am no objection on it, after collection the reply, I</p>
    <p>will send V2 to tweak it<br>
    </p>
    <p>//Hongxu<br>
    </p>
  </body>
</html>

--------------0A06E9A43D7BB95CBEF4C79A--
