Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web08.31964.1610361644012793260
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jan 2021 02:40:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=pPEj84hS;
 spf=pass (domain: konsulko.com, ip: 209.85.167.174, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f174.google.com with SMTP id l200so19600286oig.9
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Jan 2021 02:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Iwz+tTnJARQAJ/vLseoJ6/e5ppfMqeeHeyeiP1srPJI=;
        b=pPEj84hSYAV2XkobhzKEavEoeynSg+CL9kp/CtskRAA5hTTTRymUjbjNTZOJTEhHDN
         g4z9I0JozrdfnrrIjWGMjpoWEJL5lFveFwJ8hrQq1eu5EerCFPN3gelbMpthutHqbUKv
         qgcCSD5x3Z0w5gxgVkJrHhjgJvm3JPksh9DPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Iwz+tTnJARQAJ/vLseoJ6/e5ppfMqeeHeyeiP1srPJI=;
        b=RXs2y6jmDlEybPakp6o+9fJDJnWNIi5kjzSpdFDUtpLXHeUuW9wtWUxfeHZnQEhRxv
         L8YooD++TWlqNSAZKOBpoOaWDbudqNq6b0k68OA4W8cRKUmqnhkkmUgk00dZJjdsD8O/
         sxL6jpyU0LK4pYkeLonh7D7wM3IOVKLkQP61/Y3FM0DGlWptCadAgerb1PDVI4LK8lNI
         UDBEOFuqyOox2zKrjHxkTEFDugobcFtz7Vb7Fs1dxPYkmEi5nrk/T4BmA82b3Z4wQ4EP
         jngj0GcBqV/b92J9NBWxAyCa9fxpZkJpNhhcFcyfs3YJBn4wPb/4F1LkzG3979x5uDTY
         Xbrw==
X-Gm-Message-State: AOAM531nxHKJmxUQOOOpSkI0Z0mOtivkW8DfieM02JFUbrORMPhTyREN
	3Dz803te7UhIH4p6UC1Cr5oFd2xsu2NcZF18SpfZBA==
X-Google-Smtp-Source: ABdhPJyFVH62KTLg7eYqbSeeISQg2Y9+Z9iZN3PLM+JCyciXTS2IcNjj+ESdOpXmcz+mFyFHu7YTGRPY4mVMio//zl4=
X-Received: by 2002:a05:6808:a95:: with SMTP id q21mr9887910oij.6.1610361643400;
 Mon, 11 Jan 2021 02:40:43 -0800 (PST)
MIME-Version: 1.0
References: <20210111103247.11685-1-pbarker@konsulko.com> <20210111103247.11685-6-pbarker@konsulko.com>
 <16592723997B4DF6.2879@lists.openembedded.org> <CANNYZj8tG8yB28sXryqkWnj_KMYxczoByR6vNv810vhpogvx0g@mail.gmail.com>
In-Reply-To: <CANNYZj8tG8yB28sXryqkWnj_KMYxczoByR6vNv810vhpogvx0g@mail.gmail.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Mon, 11 Jan 2021 10:40:34 +0000
Message-ID: <CAM9ZRVuUm5RdxYtYXEvAL7Fe7P40S3z9f+mjKmVCDYAMGOPzTQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/6] wic: Optimise fstab modification for ext2/3/4 and msdos partitions
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Jan 2021 at 10:37, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Oh right nevermind - it's an optimization, not an actual fix which is elsewhere.

Yes, for other fstypes we just fallback on copying the rootfs
directory (using hardlinks if possible).

-- 
Paul Barker
Konsulko Group
