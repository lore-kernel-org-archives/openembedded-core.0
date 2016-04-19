Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AAC6C6072C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 01:46:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3J1k6rV023442
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Apr 2016 18:46:07 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 18 Apr 2016 18:46:06 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1459147231.git.hongxu.jia@windriver.com>
	<62a9bef209d903048c1095d90387384115eb6fd5.1459147231.git.hongxu.jia@windriver.com>
	<CALbNGRRL0O+j6axaHL3W2bKZLLyYEe1kxsiguZGL0=a1Lz8ryg@mail.gmail.com>
	<571496CC.8010607@windriver.com>
	<CALbNGRQwKQJxC+17UAoLBhhN9ZfXrYF4Ysur68NCD8v24Uavcw@mail.gmail.com>
	<57149B89.2090607@windriver.com>
	<CALbNGRTgnNYhN68zcDBKrhQ==fxP9wJ7wjj8pQ5jvMEgF=DF4g@mail.gmail.com>
	<5714A30A.9000204@windriver.com>
	<CALbNGRSBJSR4xMqCOUvu2yQcG38E=1UZBehkjmFZLdrtRyfamw@mail.gmail.com>
	<5714AA1E.9020505@windriver.com>
	<CALbNGRSe6B9-QRftL54DEEKrmCjxTt91K7FXk+CUzuGxjTvf5A@mail.gmail.com>
	<5714DC35.7040206@windriver.com>
	<CAJTo0LYTcA-c99-T_Z6q9Kn=X2C9Y1kBX+D6rzHrn+eLMUcSdA@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <57158DDA.5090003@windriver.com>
Date: Tue, 19 Apr 2016 09:46:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYTcA-c99-T_Z6q9Kn=X2C9Y1kBX+D6rzHrn+eLMUcSdA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/17] conf/bitbake.conf package.bbclass: fix dbg package not contain sources while -fdebug-prefix-map used
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
X-List-Received-Date: Tue, 19 Apr 2016 01:46:10 -0000
Content-Type: multipart/alternative;
	boundary="------------020005020700030703020803"

--------------020005020700030703020803
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/18/2016 09:55 PM, Burton, Ross wrote:
>
> On 18 April 2016 at 14:08, Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>> wrote:
>
>     If sysroot is required, override DEBUG_FLAGS to remove
>     -fdebug-prefix-map
>
>
> We should probably get this in the release notes, as many people do 
> indeed want remote debug to work.
>
> Can you tell gdb the base path to use when looking for symbols?  I've 
> not done remote GDB for some time but wouldn't "set substitute-path / 
> //my/sysroot/" work?  Or maybe /usr /my/sysroot/usr?
>
> If gdb can't be told then instead of having to replace all of 
> DEBUG_FLAGS it would be neat if the prefix mapping variables where in 
> another variable that could just be unset.
>

OK, I will try to work on GDB to let remote debug to work.

//Hongxu

> Ross


--------------020005020700030703020803
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 04/18/2016 09:55 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LYTcA-c99-T_Z6q9Kn=X2C9Y1kBX+D6rzHrn+eLMUcSdA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 18 April 2016 at 14:08, Hongxu Jia
            <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:hongxu.jia@windriver.com" target="_blank">hongxu.jia@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":c2" class="a3s aXjCH">If sysroot is required,
                override DEBUG_FLAGS to remove -fdebug-prefix-map<br>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>We should probably get this in the release notes, as
              many people do indeed want remote debug to work.</div>
            <div><br>
            </div>
            <div>Can you tell gdb the base path to use when looking for
              symbols?  I've not done remote GDB for some time but
              wouldn't "set substitute-path / //my/sysroot/" work?  Or
              maybe /usr /my/sysroot/usr?</div>
            <div><br>
            </div>
            <div>If gdb can't be told then instead of having to replace
              all of DEBUG_FLAGS it would be neat if the prefix mapping
              variables where in another variable that could just be
              unset.</div>
            <div><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    OK, I will try to work on GDB to let remote debug to work.<br>
    <br>
    //Hongxu<br>
    <br>
    <blockquote
cite="mid:CAJTo0LYTcA-c99-T_Z6q9Kn=X2C9Y1kBX+D6rzHrn+eLMUcSdA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div>Ross</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------020005020700030703020803--
