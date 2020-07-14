Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web11.1151.1594746548624169214
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2020 10:09:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VrxAZiH1;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id k5so1816096pjg.3
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2020 10:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+o3C+moIn9/5oNfXPaSDxynbiwysP56mgY64BlF+66w=;
        b=VrxAZiH1V7OKi1eXn81T0xv3TIl2vHSZQsq9zkTlz5mfDj6fFF16K/m6XGTXoN6eGD
         UAiaxlQ8/e2UytJ0F+pb1GjVJVI4DdkO/LLljGAEbiFdkctNT+g9F5GDN2bI1Dv2XJqI
         3fr8NREdfj9xAE/+S26NabtMZti1BmY91tT97lhv68umrfrcj4TbrKx4bf+ZhxIWkI5e
         giqRX25Q0ECyVIjEtSz/5RkI7tEn6uMTgCS7FyVKbWNFkpf+UH9TaWpoScpLdLBSXUtC
         /3AersGN+N+fuOAATMugdkJpxRmU+wqPrL09hTvuTf86I021cbj/0Tm3hHGXa8Z22TC1
         5onQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+o3C+moIn9/5oNfXPaSDxynbiwysP56mgY64BlF+66w=;
        b=GI0X8djguFSgJEf2a3TQPUgXF8pOSOPI1nGc23Qmjag3x0L8W8aKnYCaz0/NrahwDp
         0J9B61LRALoZa2FichEb1IzerJTRaeQ/E6Qt7eqzfVdT1qawCXX4dRPxrB6010ym3NOy
         kpsaelZgQTqzReZyn20pzFQPwgTNRDF0++QNA+EhwqhT4kBTy3K+/8lpZDBageDeyitK
         LkWZ23dNarGjLoGQY2bWIBOALVnFDyC87Hpj7kjf+JHDi729Dc2qfKdH1ksXZuiTeVif
         01cf7JHTxO04rCIdl67o4UISXMD/Qkbao02oMu9mygKbN4P4lcPpnZhkOgdJnpCLeEWG
         hX1Q==
X-Gm-Message-State: AOAM532hmfl7E2OU8IppolChRNfcitkQrfvJFqzRtbWS00dzeHK+73Lw
	Zkcg6yi2CK/nSy6hOliXqnSVD23NS/0=
X-Google-Smtp-Source: ABdhPJy85wfz4sIC6lBbXyKWDhBryeTdpbE+T5pzLj/nZ1cYlQFR184taX7XOYsRiNzIGiAtNUCTYg==
X-Received: by 2002:a17:90b:f06:: with SMTP id br6mr5402548pjb.97.1594746547129;
        Tue, 14 Jul 2020 10:09:07 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::ad4? ([2601:646:9200:4e0::ad4])
        by smtp.gmail.com with ESMTPSA id lx9sm3315445pjb.52.2020.07.14.10.09.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2020 10:09:06 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 2/2] insane: improve arch test messages
To: Ross Burton <ross@burtonini.com>, openembedded-core@lists.openembedded.org
References: <20200714170248.1036410-1-ross@burtonini.com>
 <20200714170248.1036410-2-ross@burtonini.com>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
Message-ID: <6960b415-cb15-2f34-c1c9-08f4461bb48d@gmail.com>
Date: Tue, 14 Jul 2020 10:09:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200714170248.1036410-2-ross@burtonini.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 7/14/20 10:02 AM, Ross Burton wrote:
> From: Ross Burton <ross.burton@arm.com>
> 
> The messages from the ELF 'arch' test are not obvious, clarify the
> messages and prune output paths.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes/insane.bbclass | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 89a516882b..ee19ef673e 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -364,14 +364,14 @@ def package_qa_check_arch(path,name,d, elf, messages):
>              target_os == "linux-gnu_ilp32" or re.match(r'mips64.*32', d.getVar('DEFAULTTUNE')))
>      is_bpf = (oe.qa.elf_machine_to_string(elf.machine()) == "BPF")
>      if not ((machine == elf.machine()) or is_32 or is_bpf):
> -        package_qa_add_message(messages, "arch", "Architecture did not match (%s, expected %s) on %s" % \
> -                 (oe.qa.elf_machine_to_string(elf.machine()), oe.qa.elf_machine_to_string(machine), package_qa_clean_path(path,d)))
> +        package_qa_add_message(messages, "arch", "Architecture did not match (%s, expected %s) in %s" % \

Should this be called CPU architecture as well.

> +                 (oe.qa.elf_machine_to_string(elf.machine()), oe.qa.elf_machine_to_string(machine), package_qa_clean_path(path, d, name)))
>      elif not ((bits == elf.abiSize()) or is_32 or is_bpf):
> -        package_qa_add_message(messages, "arch", "Bit size did not match (%d to %d) %s on %s" % \
> -                 (bits, elf.abiSize(), bpn, package_qa_clean_path(path,d)))
> +        package_qa_add_message(messages, "arch", "Bit size did not match (%d, expected %d) in %s" % \

Bit size perhaps should be called Word size to use more familiar term
for this.

> +                 (elf.abiSize(), bits, package_qa_clean_path(path, d, name)))
>      elif not ((littleendian == elf.isLittleEndian()) or is_bpf):
> -        package_qa_add_message(messages, "arch", "Endiannes did not match (%d to %d) on %s" % \
> -                 (littleendian, elf.isLittleEndian(), package_qa_clean_path(path,d)))
> +        package_qa_add_message(messages, "arch", "Endiannes did not match (%d, expected %d) in %s" % \

typo, it should be Endianness

> +                 (elf.isLittleEndian(), littleendian, package_qa_clean_path(path,d, name)))
>  
>  QAPATHTEST[desktop] = "package_qa_check_desktop"
>  def package_qa_check_desktop(path, name, d, elf, messages):
> 
> 
> 
> 
