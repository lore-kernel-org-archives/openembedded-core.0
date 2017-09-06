Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9302F71971
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Sep 2017 03:45:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v863j3q1008126
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 Sep 2017 20:45:04 -0700 (PDT)
Received: from [128.224.162.212] (128.224.162.212) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 5 Sep 2017 20:45:02 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1504580538.git.kai.kang@windriver.com>
	<04226f9cba6136805e2bbe98f1c8a91aa55acf08.1504580538.git.kai.kang@windriver.com>
	<CAJTo0LZusqVPy54BozHYPw45Wng4fFn4UORVRFqMCSH9rDfS7g@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <408aa803-23be-9b24-8a1f-02e640298d03@windriver.com>
Date: Wed, 6 Sep 2017 11:44:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZusqVPy54BozHYPw45Wng4fFn4UORVRFqMCSH9rDfS7g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] dbus: fix ptest runtime failures
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
X-List-Received-Date: Wed, 06 Sep 2017 03:45:05 -0000
Content-Type: multipart/alternative;
	boundary="------------01DBE4BE47547D5617A0C1C4"
Content-Language: en-US

--------------01DBE4BE47547D5617A0C1C4
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2017年09月05日 18:01, Burton, Ross wrote:
> On 5 September 2017 at 04:13, <kai.kang@windriver.com 
> <mailto:kai.kang@windriver.com>> wrote:
>
>     +PACKAGECONFIG[ptest] = "--enable-embedded-tests --enable-asserts
>     --enable-verbose-mode,--disable-embedded-tests --disable-asserts
>     --disable-verbose-mode"
>
>
> Same question with V2: does enabling ptest change the dbus daemon in 
> ways that make it slower/less secure/etc.

Unfortunately, yes, it affects performace of dbus-daemon. It checks 
macro DBUS_ENABLE_EMBEDDED_TESTS to add some test codes.
I doubt whether has someone deploy image with ptest feature to 
production environment.

It seems dbus is so fundamental that affect too much. But without them, 
ptest cases can not PASS. Confusing.


--Kai

>
> Ross


-- 
Regards,
Neil | Kai Kang


--------------01DBE4BE47547D5617A0C1C4
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2017年09月05日 18:01, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0LZusqVPy54BozHYPw45Wng4fFn4UORVRFqMCSH9rDfS7g@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">On 5 September 2017 at 04:13, <span dir="ltr">&lt;<a
            href="mailto:kai.kang@windriver.com" target="_blank"
            moz-do-not-send="true">kai.kang@windriver.com</a>&gt;</span>
        wrote:<br>
        <div class="gmail_extra">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">+PACKAGECONFIG[ptest]
              = "--enable-embedded-tests --enable-asserts
              --enable-verbose-mode,--<wbr>disable-embedded-tests
              --disable-asserts --disable-verbose-mode"<br>
            </blockquote>
            <div><br>
            </div>
            <div>Same question with V2: does enabling ptest change the
              dbus daemon in ways that make it slower/less secure/etc.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Unfortunately, yes, it affects performace of dbus-daemon. It checks
    macro DBUS_ENABLE_EMBEDDED_TESTS to add some test codes.<br>
    I doubt whether has someone deploy image with ptest feature to
    production environment.<br>
    <br>
    It seems dbus is so fundamental that affect too much. But without
    them, ptest cases can not PASS. Confusing.<br>
    <br>
    <br>
    --Kai<br>
    <br>
    <blockquote type="cite"
cite="mid:CAJTo0LZusqVPy54BozHYPw45Wng4fFn4UORVRFqMCSH9rDfS7g@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div><br>
            </div>
            <div>Ross</div>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Regards,
Neil | Kai Kang</pre>
  </body>
</html>

--------------01DBE4BE47547D5617A0C1C4--
