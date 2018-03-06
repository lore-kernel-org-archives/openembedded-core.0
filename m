Return-Path: <california.l.sullivan@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id AC65B7847D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 01:00:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Mar 2018 17:00:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,429,1515484800"; 
	d="scan'208,217";a="180167342"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga004.jf.intel.com with ESMTP; 05 Mar 2018 17:00:12 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <20180301021518.29564-1-california.l.sullivan@intel.com>
	<20180301021518.29564-8-california.l.sullivan@intel.com>
	<CAJTo0LZH136aQ6jL2G=QcYeOvxjrc9mfisrAkEYgD4dVz1G59A@mail.gmail.com>
From: Cal Sullivan <california.l.sullivan@intel.com>
Message-ID: <365619b3-671f-81b2-f9ee-9e746a77b408@intel.com>
Date: Mon, 5 Mar 2018 17:00:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZH136aQ6jL2G=QcYeOvxjrc9mfisrAkEYgD4dVz1G59A@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 07/21] grub-efi*.bbclass: don't reference vmlinuz
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
X-List-Received-Date: Tue, 06 Mar 2018 01:00:11 -0000
Content-Type: multipart/alternative;
	boundary="------------C6C0B105F682614624AC2370"
Content-Language: en-US

--------------C6C0B105F682614624AC2370
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/05/2018 04:50 AM, Burton, Ross wrote:
> On 1 March 2018 at 02:15, California Sullivan 
> <california.l.sullivan@intel.com 
> <mailto:california.l.sullivan@intel.com>> wrote:
>
>     +KERNEL_IMAGETYPE ??= "bzImage"
>
>
> You repeat this line in several classes, can we just move the default 
> to default-distrovars or similar?

I was trying to avoid adding to bitbake.conf (or things it inherits 
from) but I think it makes sense here. With the changes switching away 
from assuming "vmlinuz" and instead using KERNEL_IMAGETYPE, we now rely 
on it being set in a number of places, so setting a global default would 
be best. If I have your blessings I can make that change.

I see this patchset in is master-next and ross/mut. Should I make the 
change on top of this, or send a v4?

Thanks,
Cal
>
> Ross


--------------C6C0B105F682614624AC2370
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <br>
    <div class="moz-cite-prefix">On 03/05/2018 04:50 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0LZH136aQ6jL2G=QcYeOvxjrc9mfisrAkEYgD4dVz1G59A@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">On 1 March 2018 at 02:15, California Sullivan <span
          dir="ltr">&lt;<a href="mailto:california.l.sullivan@intel.com"
            target="_blank" moz-do-not-send="true">california.l.sullivan@intel.com</a>&gt;</span>
        wrote:<br>
        <div class="gmail_extra">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">+KERNEL_IMAGETYPE
              ??= "bzImage"<br>
            </blockquote>
            <div><br>
            </div>
            <div>You repeat this line in several classes, can we just
              move the default to default-distrovars or similar?</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    I was trying to avoid adding to bitbake.conf (or things it inherits
    from) but I think it makes sense here. With the changes switching
    away from assuming "vmlinuz" and instead using KERNEL_IMAGETYPE, we
    now rely on it being set in a number of places, so setting a global
    default would be best. If I have your blessings I can make that
    change.<br>
    <br>
    I see this patchset in is master-next and ross/mut. Should I make
    the change on top of this, or send a v4?<br>
    <br>
    Thanks,<br>
    Cal<br>
    <blockquote type="cite"
cite="mid:CAJTo0LZH136aQ6jL2G=QcYeOvxjrc9mfisrAkEYgD4dVz1G59A@mail.gmail.com">
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

--------------C6C0B105F682614624AC2370--
