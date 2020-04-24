Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.7003.1587739499538482598
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2020 07:44:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Qzcgo7Rg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id d17so11143228wrg.11
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2020 07:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=/viDQvlCvXcTlwZjnGi645t8d65SRvxXvlIUXr/Hd/k=;
        b=Qzcgo7RgEGcfXeWPQpPuoTr8Pfsu7TATmEhXylwE5LgHvXeEAD/YmN2JvHS+lX4mxv
         YHT64Xn9CBnNkabrCn7G26pjIebj5FwODErolxzmIqRz5nNl8S8vdRKCFLl0qFrKbIBX
         6k4SQU458Q1UKYtpkKDikj6Hf/0XQvrnpPcjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=/viDQvlCvXcTlwZjnGi645t8d65SRvxXvlIUXr/Hd/k=;
        b=fz0vPfLXSkjqNJocY3UYzfZI4cfUCDU+E5B9Ch+wHfQaDwAOCPI6JFb+TjL28oV//j
         J5P3NHGgnCd0Psq2NlZK+ykdMXBVPbx+qXWSAY7PJqNGKJIa9DVB8faUGoo1+4+6uscQ
         qqXmuZ+b8E/T3av/rADET+D2zX4mZuWsm+RioHziP6GnymHWVaEl+8U0sBE7QncucVtV
         MxlFcrpXeXr7Qoi1Z0ZP3Whn1ZkjMUlCcg4QN4NOOT6AiXCwqGPjUk4EhYoY2yOCpEuN
         bRBirCJ/xR3asnZHQz2KFUrHa2qsMCHz77pkk20djELJMmmVPZxv0qML1UFq0HfUkKYD
         5iZA==
X-Gm-Message-State: AGi0PubQod7CePQzpabMJI8mVY/XtBv5+Ka+EkZibLgv8AHmhTvI5+eG
	kvz+UTSQKZht0N4GiXiJoGN6Wg==
X-Google-Smtp-Source: APiQypIOJyJc32q0YcMAOxVe6ld6nYCzEG7UATJRbHW4Dq5rbhznQzazDypG0DQiyWWrYNOIWY1F9Q==
X-Received: by 2002:a5d:6445:: with SMTP id d5mr11140691wrw.373.1587739498109;
        Fri, 24 Apr 2020 07:44:58 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id k17sm3140206wmi.10.2020.04.24.07.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 07:44:57 -0700 (PDT)
Message-ID: <c0cbedfbd480c69ff4e25cad1f12e6e3ff1c6149.camel@linuxfoundation.org>
Subject: Re: [OE-core] Changing DISTRO_FEATURES / build directory
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "chris.laplante@agilent.com" <chris.laplante@agilent.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Apr 2020 15:44:56 +0100
In-Reply-To: <SN1PR12MB248060C51C546ED80B5FDE888BD00@SN1PR12MB2480.namprd12.prod.outlook.com>
References: 
	<SN1PR12MB2480D4132DF632E5161532E38BD30@SN1PR12MB2480.namprd12.prod.outlook.com>
	 <f73b90e0d744276d6929bb39518a962dc07e3e4b.camel@linuxfoundation.org>
	 <SN1PR12MB248000E2856984F4FEAB95708BD00@SN1PR12MB2480.namprd12.prod.outlook.com>
	 <adfc124fd7a2a538eacdbed44eab2cd67c6bf4f6.camel@linuxfoundation.org>
	 <SN1PR12MB248060C51C546ED80B5FDE888BD00@SN1PR12MB2480.namprd12.prod.outlook.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2020-04-24 at 14:20 +0000, chris.laplante@agilent.com wrote:
> > "contains" has special magic where it caches the specific value
> > presence
> > rather than the whole string. I'd therefore recommend using the
> > contains
> > functions where at all possible for that reason.
> 
> So then regarding my other points, it is correctly handled by the
> signature code? If so, why doesn’t it show up in task dependencies?

It should be handled correctly and it does show up.

For example, 

$ bitbake-dumpsig ./tmp/stamps/core2-64-poky-linux/dbus-test/1.12.16-r0.do_configure.sig*
Variable root_prefix value is ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '${exec_prefix}', '${base_prefix}', d)}
DISTRO_FEATURES{usrmerge} = Unset

which means DISTRO_FEATURES didn't contain "usrmerge". It would only
change hash if DISTRO_FEATURES then did contain it, there is no
absolute value dependency.

Cheers,

Richard

