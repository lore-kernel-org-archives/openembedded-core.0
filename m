Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 54D2060765
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 01:21:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8L1LWVP000987
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 20 Sep 2016 18:21:32 -0700
Received: from [128.224.162.220] (128.224.162.220) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 20 Sep 2016 18:21:31 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1474359109.git.hongxu.jia@windriver.com>
	<00a74627bbc662e9c42e0d2bc0a0d6b2adeaab4a.1474359109.git.hongxu.jia@windriver.com>
	<CAJTo0LZ=0_jwrZ=1FXnBHpd_9K=1qfnGijrXe62qSaaNenzUmQ@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <72c62e31-cd24-86e1-8ea5-2d18ef13b989@windriver.com>
Date: Wed, 21 Sep 2016 09:21:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ=0_jwrZ=1FXnBHpd_9K=1qfnGijrXe62qSaaNenzUmQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] rpm: make install with --nosignature and --nodigest work
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
X-List-Received-Date: Wed, 21 Sep 2016 01:21:33 -0000
Content-Type: multipart/alternative;
	boundary="------------2CF26B4259FB80CDAF263851"

--------------2CF26B4259FB80CDAF263851
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/20/2016 11:00 PM, Burton, Ross wrote:
>
> On 20 September 2016 at 09:15, Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>> wrote:
>
>     -Upstream-Status: Submitted [Sent email to rpm-devel@rpm5.org
>     <mailto:rpm-devel@rpm5.org>]
>     +Upstream-Status: Rejected [Sent email to rpm-devel@rpm5.org
>     <mailto:rpm-devel@rpm5.org>]
>     +http://rpm5.org/community/rpm-devel/5655.html
>     <http://rpm5.org/community/rpm-devel/5655.html>
>
>
> Considering upstream has explicitly rejected this patch, why should we 
> accept it?
>

 From his reply, he will remove "SUPPORT_NOSIGNATURES" code in future:
----------------
Note that all the code marked with "SUPPORT_NOSIGNATURES" is targeted
for removal. RPM5 has been producing MANDATORY signed packages for
more than 5 years, so all packages produced by RPM5 SHOULD have
both verifiable signatures/pubkeys included for many years now.

Your alternative (of course) is to re-patch rpm to re-add --nosignatures as
you wish: I will be happy to send you the needed patch when I remove
all the SUPPORT_NOSIGNATURES code.
----------------

If we need to support --nosignatures, we have to re-patch rpm locally.
We could drop it after upstream removes "SUPPORT_NOSIGNATURES"
code.

//Hongxu

> Ross



--------------2CF26B4259FB80CDAF263851
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 09/20/2016 11:00 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LZ=0_jwrZ=1FXnBHpd_9K=1qfnGijrXe62qSaaNenzUmQ@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 20 September 2016 at 09:15, Hongxu
            Jia <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:hongxu.jia@windriver.com" target="_blank">hongxu.jia@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":oj" class="a3s aXjCH m15746aa47dadab15">-Upstream-Status:
                Submitted [Sent email to <a moz-do-not-send="true"
                  href="mailto:rpm-devel@rpm5.org">rpm-devel@rpm5.org</a>]<br>
                +Upstream-Status: Rejected [Sent email to <a
                  moz-do-not-send="true"
                  href="mailto:rpm-devel@rpm5.org">rpm-devel@rpm5.org</a>]<br>
                +<a moz-do-not-send="true"
                  href="http://rpm5.org/community/rpm-devel/5655.html"
                  rel="noreferrer" target="_blank">http://rpm5.org/community/<wbr>rpm-devel/5655.html</a></div>
            </blockquote>
          </div>
          <br>
          Considering upstream has explicitly rejected this patch, why
          should we accept it?</div>
        <div class="gmail_extra"><br>
        </div>
      </div>
    </blockquote>
    <br>
    From his reply, he will remove "SUPPORT_NOSIGNATURES" code in
    future:<br>
    ----------------<br>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    Note that all the code marked with "SUPPORT_NOSIGNATURES" is
    targeted<br>
    for removal. RPM5 has been producing MANDATORY signed packages for<br>
    more than 5 years, so all packages produced by RPM5 SHOULD have<br>
    both verifiable signatures/pubkeys included for many years now.<br>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <br>
    Your alternative (of course) is to re-patch rpm to re-add
    --nosignatures as<br>
    you wish: I will be happy to send you the needed patch when I remove<br>
    all the SUPPORT_NOSIGNATURES code.<br>
    ----------------<br>
    <br>
    If we need to support --nosignatures, we have to re-patch rpm
    locally.<br>
    We could drop it after upstream removes "SUPPORT_NOSIGNATURES"<br>
    code.<br>
    <br>
    //Hongxu<br>
    <br>
    <blockquote
cite="mid:CAJTo0LZ=0_jwrZ=1FXnBHpd_9K=1qfnGijrXe62qSaaNenzUmQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------2CF26B4259FB80CDAF263851--
