Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.1246.1608332797079969152
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Dec 2020 15:06:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UNREG6KP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id g185so4315176wmf.3
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Dec 2020 15:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=jdwjshJwa5s3whpOt5HWenA+IOXP5fpZ+ogT/OUU7O8=;
        b=UNREG6KP+xePeVrR4dOAoQVSlmIwjtHYI+fY+nbojRPJcXVRSLGUSyfdDkS4fcJ6El
         6kIwJP6klxIoRwznz9Ke4XD3eQi9I4qYCku9RrTB6CCNzSD6QFNvz28ufnrWMFxIeiUc
         efKRuDXSe/thLxrAFYgLafZMB0E5js6FTmj5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=jdwjshJwa5s3whpOt5HWenA+IOXP5fpZ+ogT/OUU7O8=;
        b=YC4IOnRRHmzzuf08Fh2dkKjyn0MA1hGH1x3AmRKbQIEChIz5Hg53J5AsOGkMMCxgAO
         6bhQE3UYMhdwm20zAT1vwFSr9aSnVCZj5pGxkl8xfV8vfI4qU0/MvEYa7WMQIb6gCcAW
         GxPDeG73K8Xua+nBxczqaAvPxv3W8xaIhaCSqt7CdALF9DKA0HruTodNjsVYutYAXCGA
         ikQchiyugEIFCAJWCF+A1BNcASVXfkC6l5X4OtLlAUyYeAXC+Hu05AwWvzecNozLA/T2
         83os+CEmTc+rZ85jSitMYqe1ijtEHOGzT9C2v7tosG1jhcSJVY7hT3GujakGgz5m65qr
         CDYA==
X-Gm-Message-State: AOAM532ocybF7/gS30sF+0LAoQ8hgTWzVzzpedICiDxS0ZBWYTdmuzDo
	MvCpg+pFcZ5Mrh7gacibq0USyw==
X-Google-Smtp-Source: ABdhPJwM5tsEoI6MJ+Ku+B6BObXL/1JY37hJ64bgs55Yint+7jurV7Gn8tBb22UY7gSxTo5fkBxTSg==
X-Received: by 2002:a1c:e309:: with SMTP id a9mr6206793wmh.172.1608332795615;
        Fri, 18 Dec 2020 15:06:35 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.4.0.a.d.7.7.1.7.c.4.b.2.1.9.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.4.0.a.d.7.7.1.7.c.4.b.2.1.9.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:912:b4c7:177d:a044])
        by smtp.gmail.com with ESMTPSA id m21sm12975682wml.13.2020.12.18.15.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 15:06:35 -0800 (PST)
Message-ID: <f9ea5dc14572073d8844aecb81331c4a169077ba.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] oeqa/terminal : improve the test case
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 18 Dec 2020 23:06:34 +0000
In-Reply-To: <1608183270-6229-1-git-send-email-jay.shen.teoh@intel.com>
References: <16460429C740485C.10479@lists.openembedded.org>
	 <1608183270-6229-1-git-send-email-jay.shen.teoh@intel.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-12-17 at 13:34 +0800, Teoh, Jay Shen wrote:
> From: Teoh Jay Shen <jay.shen.teoh@intel.com>
> 
> -Improve this test case to fulfill the requirements of replacing the click_terminal_icon_on_X_desktop manual test case from oeqa/manual/bsp-hw :
> 1) verify that the terminal window is working without problem
> 2) verify that there's only 1 terminal window is launched
> 3) reduce test case run time
> 
> Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
> ---
>  meta/lib/oeqa/runtime/cases/terminal.py | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/meta/lib/oeqa/runtime/cases/terminal.py b/meta/lib/oeqa/runtime/cases/terminal.py
> index ea4ef02..c330054 100644
> --- a/meta/lib/oeqa/runtime/cases/terminal.py
> +++ b/meta/lib/oeqa/runtime/cases/terminal.py
> @@ -2,21 +2,20 @@ from oeqa.runtime.case import OERuntimeTestCase
>  from oeqa.core.decorator.depends import OETestDepends
>  from oeqa.runtime.decorator.package import OEHasPackage
>  
> -import re
> +import threading
> +import time
>  
>  class TerminalTest(OERuntimeTestCase):
>  
>      @OEHasPackage(['matchbox-terminal'])
>      @OETestDepends(['ssh.SSHTest.test_ssh'])
>      def test_terminal_running(self):
> -        status, output = self.target.run("export DISPLAY=:0 && matchbox-terminal",)
> -        check_terminal = re.search("Process killed - no output for 300 seconds.", output)
> -        self.assertTrue(check_terminal, msg='Terminal window should be launched without any problem')  
> -        
> -        status, output = self.target.run('pidof matchbox-terminal | wc -w')
> -        output = int(output)
> -        self.assertEqual(output, 1, 'There should be only one terminal window being launched. Terminal window launched : %s' % output)
> +        t_thread = threading.Thread(target=self.target.run, args=("export DISPLAY=:0 && matchbox-terminal -e 'sh -c \"uname -a && exec sh\"'",))
> +        t_thread.start()
> +        time.sleep(2)
>          
>          status, output = self.target.run('pidof matchbox-terminal')
> +        number_of_terminal = len(output.split())
> +        self.assertEqual(number_of_terminal, 1, msg='There should be only one terminal being launched. Number of terminal launched : %s' % number_of_terminal)
>          self.target.run('kill -9 %s' % output)
> -        self.assertEqual(status, 0, msg='Not able to find process that runs terminal.')   
> +        self.assertEqual(status, 0, msg='Not able to find process that runs terminal.') 
> \ No newline at end of file
> 

This patch doesn't seem to apply against master?

Cheers,

Richard

