Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web10.70521.1629382757050210032
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 07:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=K/iQHByQ;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id w17so12626259ybl.11
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 07:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ws34XnOrN4wOQzDn+RY0TsQb2c++P0XNKaNZe0SgrHI=;
        b=K/iQHByQR6dj841ggWfj9BWEcDOovXi0iQghFsEGQJtSWmyzud1KZubogoCsRqss/2
         zuSwHOJfdE8JtslcaPzUjHmSzAvSxVTdsTgtLCC7wip+LOO7HWo859BoI20wiZ1/ZdqC
         v7Lkbwcd+HjDaIUAUbmiuGyW9GVUA7T+Yk3GmyiTKk+MkOQB9XX7KHAKtxsYJw2zta5/
         bOhchiELCFSc9cFlsHCPkNwh1RaiA8wOaeAcNTmd4EKfdzkFwTYEP3Z2bGtvhSlUHqZA
         oCHRsAlgMqtSl7p9Fyi9rfTTAiGrkfcPCD7z1tH80AqR8OTcdQx5opMoxR37OmBAxhX2
         Tk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ws34XnOrN4wOQzDn+RY0TsQb2c++P0XNKaNZe0SgrHI=;
        b=BIZ2g48wELB8Q+6DoK7jyDnW4+a9f5KNZVsy/KLK0kiIIm45EaO4dCwlVHNQNnEYCX
         Tvc+SAYQYHI0iGb55ABFnDlFbiNgRzap6W7rkz9wAYL3kqGLorPZdlewL/DiwkgBxY7k
         LgAPv0bw3s9LXDagmpiZtuJpjrL4Hrx9AHax+iETQCBDvkxndqmvwVoKtO83k/6yWLAQ
         hPo7bBZDobVDD+IEOLxm454KcVQV3CVQiWOR4x626A3lHOpnLSMRA9b4d6Fx/dNnpoWS
         XQHpx2/bzlsIBC5+Ahibr8HnWMs/BNUdSiaIR9ckqL62Eqj2SQmQ4/fWo2L7r4X7bVXr
         QBaw==
X-Gm-Message-State: AOAM531IBhQjg0o78oz6joiyVhCFpXj/MWgUjxClHiI2Qc6MWChKQutM
	J36mXqVSBsy9ySIZDP70ceVZiQL4Z7VKuB/p06w=
X-Google-Smtp-Source: ABdhPJxBLbozKb5j5HFGLBPFNxkEikiKHFpbAgapSxrvpLAwun676eC3pWqlA66qU72dX4WJ0LwndmefkmeliMqVjCM=
X-Received: by 2002:a25:81ce:: with SMTP id n14mr19695689ybm.32.1629382756309;
 Thu, 19 Aug 2021 07:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <1629282590-16132-1-git-send-email-purushottamchoudhary29@gmail.com>
 <9263.1629375435249333143@lists.openembedded.org>
In-Reply-To: <9263.1629375435249333143@lists.openembedded.org>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Thu, 19 Aug 2021 04:19:02 -1000
Message-ID: <CAGDS+n=1cwmWnLi3hEXwxKUyfdFtkj_7921YaYA9HSX1gyxmMA@mail.gmail.com>
Subject: Re: [OE-core] [poky][dunfell][PATCHv2] python3: Remove unused python3 recipe
To: Purushottam Choudhary <purushottamchoudhary29@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 19, 2021 at 2:17 AM Purushottam Choudhary
<purushottamchoudhary29@gmail.com> wrote:

> Could you please check again?

Thanks, line wrap issues are fixed in this version.

Steve

>
>
> 
>
