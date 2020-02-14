Return-Path: <jpuhlman@mvista.com>
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
	[209.85.210.45])
	by mail.openembedded.org (Postfix) with ESMTP id A4CB560FD5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 02:02:16 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id h9so7650268otj.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 18:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language;
	bh=qimqrSUgR7aNeN8g2+OmO/JldLBUHFkqFGgKDu8V8Kg=;
	b=cPNxMlbkVvB/T1I7RE9A9TMuJ+ik7LiEcmd1brOff5gSmKEQer/+3n2DyBCPCnu4A8
	pr8hdFvKAvQuoM27FTn5Xg4dARWqdmiQIanP4NGfIxT/1mNprFxs5oTFSeNZgFg5BRPD
	g4u2kfGXSeovLAbsW+Wy5Hc16alJKRgUyOyZ7btly+Ue0omgk2a6kbYzj515QK5qoAnt
	fwJBrf/e03yMwRkb84XukZMAr32u5lLFmNAkvtc9YeaIFpitGM+g/HrVXRv0Hm0RLDFG
	cUgxg1EeOcWIcQWTAobNDULuMyjk6LnsHvvqMkkIPIAlcL1DvekAHAkzL7pw+dV9G1QV
	RUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=qimqrSUgR7aNeN8g2+OmO/JldLBUHFkqFGgKDu8V8Kg=;
	b=WWpbsmiGwzYfbxb6xYtHXc9MnrV8ZjRS5Bb3o1VvJb5SDCs/Sj7xYefNQuvEwTKbMh
	d5zWpLjRFL2cqTQeJ1XlTEk5v2JFLnw+xXvGM0DVLyqRvxjaO7dEckenMi6g23bfbWx6
	byH/U+txKI1M8YVbTJu3fIvpsm9mO6pvy3OATwiIOldkCJIytw8FWVAI7R9T0+Po0SM6
	KIqYtogO3KK8nMRaa2VkiVHm1QtdxWOEYjF/2GzUWhbworcUkqOcmCqhv+BrMVWsxqOP
	baPzaUvRPWIENWaLJw/2MCWtifTnDbnXV3lBMo6NPAeh23BSAhhBX4GJ6oBIdnM06vWv
	tjkw==
X-Gm-Message-State: APjAAAWJpi0nNfnzbwx/ZoxPahwVLaMfv80UwCsbUgzd2aZGQ08zBx7/
	oocRFN69FjBR5SoenVg1i1bRVPmv2Ds=
X-Google-Smtp-Source: APXvYqybPWRM2msdX+MANXR0NR3saPmRSiskK7ypeVrZ4b8GBGl+iNTGQMM73EvJ+VIEnIEMCNk0bA==
X-Received: by 2002:a9d:4110:: with SMTP id o16mr397482ote.101.1581645736945; 
	Thu, 13 Feb 2020 18:02:16 -0800 (PST)
Received: from ?IPv6:2600:1700:4c90:60a0:18f0:30d2:de29:e134?
	([2600:1700:4c90:60a0:18f0:30d2:de29:e134])
	by smtp.gmail.com with ESMTPSA id g25sm1448835otr.8.2020.02.13.18.02.15
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 13 Feb 2020 18:02:16 -0800 (PST)
To: Andrew Boos <andrew@avilution.com>,
	openembedded-core@lists.openembedded.org
References: <CAGgh2e88CwQZjrosOkZ4Jdd4nK2V=YC3+e65eRmLrqdUSPC73Q@mail.gmail.com>
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Message-ID: <1b01b37f-ba3b-da34-8e04-81e3f2dd72fb@mvista.com>
Date: Thu, 13 Feb 2020 18:01:54 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAGgh2e88CwQZjrosOkZ4Jdd4nK2V=YC3+e65eRmLrqdUSPC73Q@mail.gmail.com>
Subject: Re: Unknown Postinstall Scriptlet Failing to Defer Boot
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
X-List-Received-Date: Fri, 14 Feb 2020 02:02:16 -0000
Content-Type: multipart/alternative;
	boundary="------------E6EB8CF3D2FD22DC4C4644CC"
Content-Language: en-US

--------------E6EB8CF3D2FD22DC4C4644CC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

In these kind of cases, by providing the actual error message, people 
can provide more help.

The recipe inherits update-alternatives and sets a large number of 
alternatives. The alternatives are done in the automatically added post 
install scripts. In all likelihood one of the listed links is wrong, or 
already a symlink or something similar.
On 2/13/2020 4:49 PM, Andrew Boos wrote:
> Hi,
>
> I am working on a bitbake build and I am running into an issue where a 
> postinst scriptlet is failing via "exit 1" to defer to first boot and 
> I cannot figure out which recipe is causing the issue. Does anybody 
> have any tips on identifying which recipe is actually exiting with a 
> failure? The error log says that it is in imagemagick but the recipe 
> does not have any postinst scripts defined. Also, there are no 
> imagemagick .bbappend files in my layers. 
> (https://github.com/openembedded/meta-openembedded/blob/sumo/meta-oe/recipes-support/imagemagick/imagemagick_7.0.7.bb)
>
> Thanks,
> Andrew
>
> <http://www.avg.com/email-signature?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=emailclient> 
> 	Virus-free. www.avg.com 
> <http://www.avg.com/email-signature?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=emailclient> 
>
>
> <#DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2>
>

-- 
Jeremy A. Puhlman
jpuhlman@mvista.com


--------------E6EB8CF3D2FD22DC4C4644CC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <font size="+1"><tt>In these kind of cases, by providing the actual
        error message, people can provide more help. </tt><tt><br>
      </tt><tt><br>
      </tt><tt>The recipe inherits </tt></font><tt><span style="color: rgb(36, 41, 46); font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: pre; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"><font size="+1">update-alternatives and sets a large number of alternatives. The alternatives
are done in the automatically added post install scripts. In all likelihood one of the listed links
is wrong, or already a symlink or something similar.</font>
</span></tt><br>
    <div class="moz-cite-prefix">On 2/13/2020 4:49 PM, Andrew Boos
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAGgh2e88CwQZjrosOkZ4Jdd4nK2V=YC3+e65eRmLrqdUSPC73Q@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="auto">
        <div dir="auto">Hi,</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">I am working on a bitbake build and I am running
          into an issue where a postinst scriptlet is failing via "exit
          1" to defer to first boot and I cannot figure out which recipe
          is causing the issue. Does anybody have any tips on
          identifying which recipe is actually exiting with a failure?
          The error log says that it is in imagemagick but the recipe
          does not have any postinst scripts defined. Also, there are no
          imagemagick .bbappend files in my layers. (<a
href="https://github.com/openembedded/meta-openembedded/blob/sumo/meta-oe/recipes-support/imagemagick/imagemagick_7.0.7.bb"
            moz-do-not-send="true">https://github.com/openembedded/meta-openembedded/blob/sumo/meta-oe/recipes-support/imagemagick/imagemagick_7.0.7.bb</a>)</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">Thanks,</div>
        <div dir="auto">Andrew</div>
      </div>
      <div id="DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2"><br>
        <table style="border-top: 1px solid #D3D4DE;">
          <tbody>
            <tr>
              <td style="width: 55px; padding-top: 13px;"><a
href="http://www.avg.com/email-signature?utm_medium=email&amp;utm_source=link&amp;utm_campaign=sig-email&amp;utm_content=emailclient"
                  target="_blank" moz-do-not-send="true"><img
src="https://ipmcdn.avast.com/images/icons/icon-envelope-tick-green-avg-v1.png"
                    alt="" style="width: 46px; height: 29px;"
                    moz-do-not-send="true" width="46" height="29"></a></td>
              <td style="width: 470px; padding-top: 12px; color:
                #41424e; font-size: 13px; font-family: Arial, Helvetica,
                sans-serif; line-height: 18px;">Virus-free. <a
href="http://www.avg.com/email-signature?utm_medium=email&amp;utm_source=link&amp;utm_campaign=sig-email&amp;utm_content=emailclient"
                  target="_blank" style="color: #4453ea;"
                  moz-do-not-send="true">www.avg.com</a> </td>
            </tr>
          </tbody>
        </table>
        <a href="#DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2" width="1"
          height="1" moz-do-not-send="true"> </a></div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
Jeremy A. Puhlman
<a class="moz-txt-link-abbreviated" href="mailto:jpuhlman@mvista.com">jpuhlman@mvista.com</a>
</pre>
  </body>
</html>

--------------E6EB8CF3D2FD22DC4C4644CC--
