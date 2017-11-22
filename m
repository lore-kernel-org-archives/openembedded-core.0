Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7E00171A30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 15:19:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vAMFJXT8005190
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 22 Nov 2017 07:19:34 -0800 (PST)
Received: from [128.224.162.147] (128.224.162.147) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 22 Nov 2017 07:19:21 -0800
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1510898885-256081-1-git-send-email-hongxu.jia@windriver.com>
	<CAJTo0LaojmxziZDKu48jfM4K+TW6V9ra=FE8x_oJSz3ps+gG-g@mail.gmail.com>
	<cbb65333-4bc3-ec34-ffed-da65fc767030@windriver.com>
	<CADkTA4O=gNCQLLJ5Yu5MM7T2kbEb1=RFjb=Va0vUoS1VW7CEYA@mail.gmail.com>
	<a738dbce-f217-54a3-c633-7945dafd462e@windriver.com>
	<CAJTo0LZNDCQNS9pCphNowjKTN-3ArhtCs2QMXz37FKkMTGujDA@mail.gmail.com>
	<f5d2f302-55a0-f48a-7ece-e7b38235f7ea@windriver.com>
	<CADkTA4OCsE=g3OJL+p1rbXz1ghy6e7G7_8dEdWcdS_s+jxa-_w@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <99bc79c9-29c7-083d-854b-95315e15e769@windriver.com>
Date: Wed, 22 Nov 2017 23:21:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4OCsE=g3OJL+p1rbXz1ghy6e7G7_8dEdWcdS_s+jxa-_w@mail.gmail.com>
Cc: Joshua Lock <joshua.g.lock@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] systemd: fix formatting IDE storage does not trigger "change" uevents
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
X-List-Received-Date: Wed, 22 Nov 2017 15:19:34 -0000
Content-Type: multipart/alternative;
	boundary="------------62B2528F1139CBBBE3B65207"
Content-Language: en-US

--------------62B2528F1139CBBBE3B65207
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit


>
> If you send a change for the kernel configuration, I can merge it, but not
> activate it (i.e. I won't send SRCREV bumps), so as long as the 
> autobuilder
> can build a branch, we can queue this part of the change for testing.
>

Got it, thanks

//Hongxu

> Bruce
>
>
>     3. Most importantly, how to test, when find a way,
>         the ideally is to add the test case to oe-core's
>         meta-selftest
>
>        I should do some investigation on the storage test.
>
>     So I think I should do 3 first, and then 1/2 later
>
>     //Hongxu
>
>>     Ross
>
>
>
>
>
> -- 
> "Thou shalt not follow the NULL pointer, for chaos and madness await 
> thee at its end"



--------------62B2528F1139CBBBE3B65207
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <blockquote type="cite"
cite="mid:CADkTA4OCsE=g3OJL+p1rbXz1ghy6e7G7_8dEdWcdS_s+jxa-_w@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div><br>
            </div>
            <div>If you send a change for the kernel configuration, I
              can merge it, but not</div>
            <div>activate it (i.e. I won't send SRCREV bumps), so as
              long as the autobuilder</div>
            <div>can build a branch, we can queue this part of the
              change for testing.</div>
            <div><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Got it, thanks<br>
    <br>
    //Hongxu<br>
    <br>
    <blockquote type="cite"
cite="mid:CADkTA4OCsE=g3OJL+p1rbXz1ghy6e7G7_8dEdWcdS_s+jxa-_w@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div>Bruce</div>
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div text="#000000" bgcolor="#FFFFFF"> <br>
                3. Most importantly, how to test, when find a way,<br>
                    the ideally is to add the test case to oe-core's <br>
                    meta-selftest<br>
                <br>
                   I should do some investigation on the storage test.<br>
                <br>
                So I think I should do 3 first, and then 1/2 later<br>
                <br>
                //Hongxu<br>
                <br>
                <blockquote type="cite">
                  <div dir="ltr">
                    <div class="gmail_extra">
                      <div class="gmail_quote">
                        <div>Ross </div>
                      </div>
                    </div>
                  </div>
                </blockquote>
                <p><br>
                </p>
              </div>
            </blockquote>
          </div>
          <br>
          <br clear="all">
          <div><br>
          </div>
          -- <br>
          <div class="gmail_signature" data-smartmail="gmail_signature">"Thou
            shalt not follow the NULL pointer, for chaos and madness
            await thee at its end"</div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------62B2528F1139CBBBE3B65207--
