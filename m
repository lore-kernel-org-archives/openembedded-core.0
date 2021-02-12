Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web09.7984.1613153796627953272
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Feb 2021 10:16:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Qe/XxUq0;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 18so571703oiz.7
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Feb 2021 10:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=YrD7t7URZj39KxfnHkuruWKv/FxaVU02Fk0/z8GzNQo=;
        b=Qe/XxUq0DHUj8/84D8FKxCuTHpURwP6rTQqZ8Z7UPA1fKM9tqiqE9htXsJmMPAXJre
         8eVt6Mj4PI0pkmj1JRWBUr02R+pGUl51SgnhRo0oSireG4I21+zUVu6VQEyT0Tq2FM2I
         lZqobW4VPnkV+j0lLZ2Sjgim4IgTPgho7sAF1nW/+es+L3pkOhz8FBy5gZMyPwnyDjRV
         /Kr6yosWtqVod2FnpaisSzD9RtA0mfwA9ykCw7jPpu5v0ohlrpvH0LLfGV9+DSskfwRS
         xN442wXyDIDqdSlaWeFge9prXMjF7HGJ8MJD5dUt4O58QwVBLd4upy9wbkkt2wm5AW/T
         lezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=YrD7t7URZj39KxfnHkuruWKv/FxaVU02Fk0/z8GzNQo=;
        b=sZuE+n3rQh/OYPIIXWlrnoth21+4Y1Vz6WTjjWAM9Nz+pbIhBusGLqao5HetxyJnms
         p7Q4xmH2Awh2VDe/Lc1wtTohNKPawY6iDanUyxrEL9dWYSWKzgdw10CmN2vUIl+MN3yL
         i8c+RMHVLILNElv2c1nhysDcy0xfqLm6zK0r2SD/o+uFs/NijG3989E4p6olOrV7cj23
         4V/niJYk0cq5vBq/fTZ3Cr17Wh7MNqmVwH6JMm/OZ03Nw/OUQj3elxZkiy4+Yk1Xj8YJ
         XAHi+E+9DYQ5EwLhl5cD5bRJ+m6JHJopIi/dT8+G/2Lf5QwETYNKB1GfwYGgI9P5dOJn
         1W4A==
X-Gm-Message-State: AOAM533JqWsWTP7oN11KhsoLhE4t+a5/q3ig4a1gA3pPzmWzLliR++7C
	8hk0dNdjofLFkWyFn0wnxzVa4e126Ak=
X-Google-Smtp-Source: ABdhPJzizl5BXVpMK2J0xoPGtY2cBxelhyB8n5CO+oUk8PQtLECZKYCvSPPMrtUf+mbUmxPjD+VyGw==
X-Received: by 2002:aca:1003:: with SMTP id 3mr506220oiq.22.1613153795763;
        Fri, 12 Feb 2021 10:16:35 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d? ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id l67sm1956932oih.57.2021.02.12.10.16.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Feb 2021 10:16:35 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [OE-core][PATCH] weston: remoting backend requires GStreamer base plugins
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20210212165146.21830-1-JPEWhacker@gmail.com>
 <CAP9ODKp=mKt+9gekQmb3gF-tueWfS9tnr9JVJmHvXorqdwU1ow@mail.gmail.com>
Message-ID: <3dbd00de-129c-39fa-f94c-b9f76ab9deab@gmail.com>
Date: Fri, 12 Feb 2021 12:16:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKp=mKt+9gekQmb3gF-tueWfS9tnr9JVJmHvXorqdwU1ow@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 2/12/21 11:59 AM, Otavio Salvador wrote:
> Em sex., 12 de fev. de 2021 às 13:52, Joshua Watt
> <JPEWhacker@gmail.com> escreveu:
>> -PACKAGECONFIG[remoting] = "-Dremoting=true,-Dremoting=false,gstreamer1.0"
>> +PACKAGECONFIG[remoting] = "-Dremoting=true,-Dremoting=false,gstreamer1.0 gstreamer1.0-plugins-base"
> The base is needed as build dependency or runtime?

build time. It's basically making it's own gstreamer element (GstAppSrc) 
to be inserted into the pipeline as the source. Also, meson looks for 
the dependency at build time so it can link against the proper libraries


>
