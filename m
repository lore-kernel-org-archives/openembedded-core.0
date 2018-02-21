Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 55BD16FEFE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Feb 2018 04:47:25 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id j9so232850pgv.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 20:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=+6zLHJgN5IV4yI5SjbY9871iX5ss9F0R3nVTJwZ2NRY=;
	b=NTMF3in3PQtS7ZM3KZyISJx8pEpI/Y4JYCfNj6FUg99URgQbL1+/cwcLe7zv93ziqm
	5I55KTSM9YuGO9uvLSSfC0GZupBZiY389+03nh89D14O2cCV1ofOW/w9g5JLFwZPQp4o
	qvELYezzhOsN+/v2S+bpos/qGJj1D21xZZkU431j+xz0dE0u93vJs1bEl/eFiAjis7nN
	o7Z1uMk9OS1Q82GqG3OGu3bVsd/fgqauF2Hq18ExxrZ9v0Z7htbbWTmBpla+l1AhqEjf
	dIU6qO/F1YHz1bM48KncETIYS4+CKBTL2qfjZC755yGOEa5noPY3PqVcOq+0w3HOMFGM
	w2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=+6zLHJgN5IV4yI5SjbY9871iX5ss9F0R3nVTJwZ2NRY=;
	b=lH2bIWJnZZUcDK8jCAWELErmHY/kjJXI36/OfzkUtpZ86lUzDB3FzR4w0pIEKqqf39
	8vzmu+LeBbOO+4Gk9/hu9FVBSAF0+I3r6n72Y9KLnpri685myepsPiIAqWjitRXKSayM
	ZHDrtkIlYHle3uk7IiCSjUFqaMsGZmWVRUt0j3Cm42dTWWkVcyS3bDIyO7Dz2eJGXuxz
	GphO8HDnfORFIm6VJRB/q/iO5zq19GZYUlqgjUMw52e7MUrQo6g8oGLUjuEInbvlBeyF
	KkQMWd3rzExhzH6QF+fRD6JQeKRHyu5TGRYYuDtI72/JG9odYGZ5ouJdQrLnZIYp3WHQ
	cN0Q==
X-Gm-Message-State: APf1xPAKcvszjERPWe+TCtIaUw//2LEEnS2lPVwDoO4mGloTv2f8toNw
	4vxZrgtrbVzRhmxnl8RLXkB4uA==
X-Google-Smtp-Source: AH8x2256N/kKBSHfxRMjBqzjAuLrXftlRv1kX4PrJL8zz+WujfHgagr9vtzCiAzYW6OBDMDUH0IC3A==
X-Received: by 10.99.1.206 with SMTP id 197mr1646057pgb.179.1519188447088;
	Tue, 20 Feb 2018 20:47:27 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:88:5af5:94f3:78b1?
	([2601:202:4000:1184:88:5af5:94f3:78b1])
	by smtp.gmail.com with ESMTPSA id
	q14sm28869514pgq.2.2018.02.20.20.47.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Feb 2018 20:47:26 -0800 (PST)
To: Andrei Gherzan <andrei@gherzan.ro>,
	"Palleti, Avinash Reddy" <avinash.reddy.palleti@intel.com>,
	akuster@mvista.com
References: <CAK18fxEEZRnHzobX=Lt2By_VYgEzi36nSU+X_94Etegh8E81mg@mail.gmail.com>
	<cc978b8d-afa0-5ea2-ba5d-9700bab26fdc@linux.intel.com>
	<EBAEBC3AA1B73F4887F286A6723535236597E79C@BGSMSX102.gar.corp.intel.com>
	<CAK18fxGNk3vxKeLVpoa7TCuuCq_jkkmMmj3D6Z-hM494ASF5kA@mail.gmail.com>
	<CAK18fxHDUWXhLuqRn0h2Kq+m3M34PwPhJTpwhAnm3bEqN22x0g@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <2be633e3-4845-fe97-07fe-dbf12beaf9d4@gmail.com>
Date: Tue, 20 Feb 2018 20:47:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAK18fxHDUWXhLuqRn0h2Kq+m3M34PwPhJTpwhAnm3bEqN22x0g@mail.gmail.com>
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: Linux firmware for iwlwifi 8000c disappeared in pyro
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
X-List-Received-Date: Wed, 21 Feb 2018 04:47:26 -0000
Content-Type: multipart/alternative;
	boundary="------------F0B2C6EC841E7788EB990B19"
Content-Language: en-US

--------------F0B2C6EC841E7788EB990B19
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

in stable/pyro-next


On 02/20/2018 04:50 AM, Andrei Gherzan wrote:
> On Fri, Feb 16, 2018 at 2:08 PM, Andrei Gherzan <andrei@gherzan.ro
> <mailto:andrei@gherzan.ro>> wrote:
>
>     On Fri, Feb 16, 2018 at 1:48 PM, Palleti, Avinash Reddy
>     <avinash.reddy.palleti@intel.com
>     <mailto:avinash.reddy.palleti@intel.com>> wrote:
>
>          I submitted a fix sometime back,
>         http://lists.openembedded.org/pipermail/openembedded-core/2018-February/147291.html
>         <http://lists.openembedded.org/pipermail/openembedded-core/2018-February/147291.html>
>
>
>     Great. We have the fix available and approved by Saul. Shall we merge?
>
>
> Adding the pyro maintainer to this thread. 
>
> --
> Andrei Gherzan
>
>


--------------F0B2C6EC841E7788EB990B19
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>in stable/pyro-next<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 02/20/2018 04:50 AM, Andrei Gherzan
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAK18fxHDUWXhLuqRn0h2Kq+m3M34PwPhJTpwhAnm3bEqN22x0g@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra">
          <div>
            <div class="gmail_signature"
              data-smartmail="gmail_signature">
              <div dir="ltr">
                <div dir="ltr">On Fri, Feb 16, 2018 at 2:08 PM, Andrei
                  Gherzan <span dir="ltr">&lt;<a
                      href="mailto:andrei@gherzan.ro" target="_blank"
                      moz-do-not-send="true">andrei@gherzan.ro</a>&gt;</span>
                  wrote:<br>
                </div>
              </div>
            </div>
          </div>
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div dir="ltr">
                <div class="gmail_extra">
                  <div class="gmail_quote"><span class="">On Fri, Feb
                      16, 2018 at 1:48 PM, Palleti, Avinash Reddy <span
                        dir="ltr">&lt;<a
                          href="mailto:avinash.reddy.palleti@intel.com"
                          target="_blank" moz-do-not-send="true">avinash.reddy.palleti@intel.<wbr>com</a>&gt;</span>
                      wrote:<br>
                      <blockquote class="gmail_quote" style="margin:0 0
                        0 .8ex;border-left:1px #ccc
                        solid;padding-left:1ex"> I submitted a fix
                        sometime back,<br>
                        <a
href="http://lists.openembedded.org/pipermail/openembedded-core/2018-February/147291.html"
                          rel="noreferrer" target="_blank"
                          moz-do-not-send="true">http://lists.openembedded.org/<wbr>pipermail/openembedded-core/20<wbr>18-February/147291.html</a><br>
                        <div>
                          <div class="m_5106601931707792508h5"><br>
                          </div>
                        </div>
                      </blockquote>
                      <div><br>
                      </div>
                    </span>
                    <div>Great. We have the fix available and approved
                      by Saul. Shall we merge?</div>
                  </div>
                </div>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>Adding the pyro maintainer to this thread. </div>
            <div><br>
            </div>
            <div>
              <div
style="color:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initial">--</div>
              <span
style="color:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initial;float:none;display:inline">Andrei
                Gherzan</span><br>
            </div>
          </div>
        </div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------F0B2C6EC841E7788EB990B19--
