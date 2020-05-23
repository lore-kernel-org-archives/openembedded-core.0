Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.2340.1590260156922758611
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 May 2020 11:55:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dHZ9ZVrZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: gzatko@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id u188so13189477wmu.1
        for <openembedded-core@lists.openembedded.org>; Sat, 23 May 2020 11:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=Td0nS0HDlzWz1jZdUr8ILpc5WXR34YkM6elCB/r3A1s=;
        b=dHZ9ZVrZhonfSnTEIXdD/v9GISONgD1FtV4BChCBPQ/7C0//3CjDSoWopx2YF0VbIq
         Jo3F3inrWf9YIzjq/1+tQUOtxu+TZbD3+2QbGpX8bxsBxStwd/fZQdolLPfxYB9V6oHU
         gdoyiaqeR4Bhoz8FAu0TSiaTsPuk2+hWYvI2PcK5bOJtEczAkmv60DjB5Btn0UEVaLqK
         haNf/1304IbahahhwME9g70x1Yvs/QwSv2eII2Lgrt8epSHNbTBrIf+Pt9AQuGhqN6cG
         JDbtX21NA8EeDKhOQGYxw8XCv3QWi1Z60mImeZK1qC3fzbuNkeIYkEJnStr5EheFhQzX
         3I/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=Td0nS0HDlzWz1jZdUr8ILpc5WXR34YkM6elCB/r3A1s=;
        b=m7nWmBKjdq32vVGLngUqdG/YBW21t09NzcrTuRWkr+m5fkTCHQmxm3QCnFPL/e7Igq
         FfIEfb5B1OiTjmHU4u/v1buCzcRw5CFmjAZD1B21F05IgQBfSI2kBktKScWuW6sKnHTG
         CpJyzwUz6Y6K7Y8eCkhbJaW2NGLUNDn+gJTG4x00qOVY/M5DeywlnIb79mIdhXFg7DOt
         poWfilHXIp5IpwE8VoFueCnYS+R4+pHpq55EsENDz0uOsjy69oSMW3K93TIiFJcX8iOF
         5PhVgp3/cnN/slUqhSUbW7oCez4wmmCC/OExaaDC/h9FzJeug1l+CHVpe4pOQ5MT1CP9
         Y+3g==
X-Gm-Message-State: AOAM533d9I2DcmPw57MpM/XTeALkbjrPY2K5LDI7vpxzPn+qXEWyUkm4
	zRIZ/z5QBRuuX4TVL7tm9Dk=
X-Google-Smtp-Source: ABdhPJz7ippX+JV9VZ7VnkEitdxXlwr35hcW1NkvBF8l0sBL1oPnM7HTWchhTFA/4RK7KIKRftPTjw==
X-Received: by 2002:a1c:a5d2:: with SMTP id o201mr11118917wme.27.1590260155106;
        Sat, 23 May 2020 11:55:55 -0700 (PDT)
Return-Path: <gzatko@gmail.com>
Received: from blizzard-1040g6.lan (93.184.67.240.host.vnet.sk. [93.184.67.240])
        by smtp.gmail.com with ESMTPSA id n9sm13589482wmj.5.2020.05.23.11.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2020 11:55:54 -0700 (PDT)
Message-ID: <12ca0894722b92b97d601dd957d25a3c6d9ed396.camel@gmail.com>
Subject: Re: [OE-core] [PATCH] docbook-xml: update recipe to stick with the upstream
From: "Gregor Zatko" <gzatko@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Sat, 23 May 2020 20:55:53 +0200
In-Reply-To: <CANNYZj-Fv7z_JYFgLhgj1vXpTGeJ_0Sk0MvyiOKDqsftBeBWMQ@mail.gmail.com>
References: <20200523172049.1156001-1-gzatko@gmail.com>
	 <CANNYZj-Fv7z_JYFgLhgj1vXpTGeJ_0Sk0MvyiOKDqsftBeBWMQ@mail.gmail.com>
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-pgRf8N/wtfiSNz83VVLW"

--=-pgRf8N/wtfiSNz83VVLW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Yes I think so. I supposed that if there's only 4 catalogs it can be
done this way but if the policy is to download everything then OK -
I'll rewrite the recipe, hope this time finally well.
G.
On Sat, 2020-05-23 at 20:50 +0200, Alexander Kanavin wrote:
> Can the original source be fetched though? Copying things over into
> the layer itself is not the best option.
> 
> Alex
> 
> 
> On Sat, 23 May 2020 at 19:20, Gregor Zatko <gzatko@gmail.com> wrote:
> > From: Gregor Zatko <gzatko@zoznam.sk>
> > 
> > 
> > 
> > Until now a Debian package has been used as a source.
> > 
> > This change just switches it to project's upstream.
> > 
> > 
> > 
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=13270
> > 
> > 
> > 
> > Signed-off-by: Gregor Zatko <gzatko@gmail.com>
> > 
> > ---
> > 
> >  .../docbook-xml-dtd4/catalogs/catalog-4.2.xml | 115 ++++
> > 
> >  .../docbook-xml-dtd4/catalogs/catalog-4.3.xml | 115 ++++
> > 
> >  .../docbook-xml-dtd4/catalogs/catalog-4.4.xml | 124 +++++
> > 
> >  .../docbook-xml-dtd4/catalogs/catalog-4.5.xml | 124 +++++
> > 
> >  .../docbook-xml-update-catalog.xml.patch      | 515 --------------
> > ----
> > 
> >  .../docbook-xml/docbook-xml-dtd4_4.5.bb       |  52 +-
> > 
> >  6 files changed, 502 insertions(+), 543 deletions(-)
> > 
> >  create mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-
> > dtd4/catalogs/catalog-4.2.xml
> > 
> >  create mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-
> > dtd4/catalogs/catalog-4.3.xml
> > 
> >  create mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-
> > dtd4/catalogs/catalog-4.4.xml
> > 
> >  create mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-
> > dtd4/catalogs/catalog-4.5.xml
> > 
> >  delete mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-
> > dtd4/docbook-xml-update-catalog.xml.patch
> > 
> > 
> > 
> > diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-
> > dtd4/catalogs/catalog-4.2.xml b/meta/recipes-devtools/docbook-
> > xml/docbook-xml-dtd4/catalogs/catalog-4.2.xml
> > 
> > new file mode 100644
> > 
> > index 0000000000..6920c2f7e0
> > 
> > --- /dev/null
> > 
> > +++ b/meta/recipes-devtools/docbook-xml/docbook-xml-
> > dtd4/catalogs/catalog-4.2.xml
> > 
> > @@ -0,0 +1,115 @@
> > 
> > +<?xml version='1.0'?>
> > 
> > +<catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
> > 
> > +
> > 
> > +<!--
> > ...................................................................
> > ... -->
> > 
> > +<!-- XML Catalog data for DocBook XML V4.2
> > ................................ -->
> > 
> > +<!-- File catalog.xml
> > ..................................................... -->
> > 
> > +
> > 
> > +<!-- Please direct all questions, bug reports, or suggestions for
> > 
> > +     changes to the docbook@lists.oasis-open.org mailing list. For
> > more
> > 
> > +     information, see http://www.oasis-open.org/.
> > 
> > +  -->
> > 
> > +
> > 
> > +<!-- This is the catalog data file for DocBook V4.2. It is
> > provided as
> > 
> > +     a convenience in building your own catalog files. You need
> > not use
> > 
> > +     the filenames listed here, and need not use the filename
> > method of
> > 
> > +     identifying storage objects at all.  See the documentation
> > for
> > 
> > +     detailed information on the files associated with the DocBook
> > DTD.
> > 
> > +     See XML Catalogs at 
> > http://www.oasis-open.org/committees/entity/ for
> > 
> > +     detailed information on supplying and using catalog data.
> > 
> > +  -->
> > 
> > +
> > 
> > +<!--
> > ...................................................................
> > ... -->
> > 
> > +<!-- DocBook driver file
> > .................................................. -->
> > 
> > +
> > 
> > +<public publicId="-//OASIS//DTD DocBook XML V4.2//EN"
> > 
> > +        uri="docbookx.dtd"/>
> > 
> > +
> > 
> > +<!--
> > ...................................................................
> > ... -->
> > 
> > +<!-- DocBook modules
> > ...................................................... -->
> > 
> > +
> > 
> > +<public publicId="-//OASIS//DTD DocBook CALS Table Model V4.2//EN"
> > 
> > +        uri="calstblx.dtd"/>
> > 
> > +
> > 
> > +<public publicId="-//OASIS//DTD XML Exchange Table Model
> > 19990315//EN"
> > 
> > +        uri="soextblx.dtd"/>
> > 
> > +
> > 
> > +<public publicId="-//OASIS//ELEMENTS DocBook Information Pool
> > V4.2//EN"
> > 
> > +        uri="dbpoolx.mod"/>
> > 
> > +
> > 
> > +<public publicId="-//OASIS//ELEMENTS DocBook Document Hierarchy
> > V4.2//EN"
> > 
> > +        uri="dbhierx.mod"/>
> > 
> > +
> > 
> > +<public publicId="-//OASIS//ENTITIES DocBook Additional General
> > Entities V4.2//EN"
> > 
> > +        uri="dbgenent.mod"/>
> > 
> > +
> > 
> > +<public publicId="-//OASIS//ENTITIES DocBook Notations V4.2//EN"
> > 
> > +        uri="dbnotnx.mod"/>
> > 
> > +
> > 
> > +<public publicId="-//OASIS//ENTITIES DocBook Character Entities
> > V4.2//EN"
> > 
> > +        uri="dbcentx.mod"/>
> > 
> > +
> > 
> > +<!--
> > ...................................................................
> > ... -->
> > 
> > +<!-- ISO entity sets
> > ...................................................... -->
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Diacritical
> > Marks//EN//XML"
> > 
> > +        uri="ent/iso-dia.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Numeric and Special
> > Graphic//EN//XML"
> > 
> > +        uri="ent/iso-num.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Publishing//EN//XML"
> > 
> > +        uri="ent/iso-pub.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES General
> > Technical//EN//XML"
> > 
> > +        uri="ent/iso-tech.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Added Latin 1//EN//XML"
> > 
> > +        uri="ent/iso-lat1.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Added Latin 2//EN//XML"
> > 
> > +        uri="ent/iso-lat2.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Greek Letters//EN//XML"
> > 
> > +        uri="ent/iso-grk1.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Monotoniko
> > Greek//EN//XML"
> > 
> > +        uri="ent/iso-grk2.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Greek Symbols//EN//XML"
> > 
> > +        uri="ent/iso-grk3.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Alternative Greek
> > Symbols//EN//XML"
> > 
> > +        uri="ent/iso-grk4.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Arrow Relations//EN//XML"
> > 
> > +        uri="ent/iso-amsa.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Binary Operators//EN//XML"
> > 
> > +        uri="ent/iso-amsb.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Delimiters//EN//XML"
> > 
> > +        uri="ent/iso-amsc.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Negated Relations//EN//XML"
> > 
> > +        uri="ent/iso-amsn.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Ordinary//EN//XML"
> > 
> > +        uri="ent/iso-amso.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Relations//EN//XML"
> > 
> > +        uri="ent/iso-amsr.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Box and Line
> > Drawing//EN//XML"
> > 
> > +        uri="ent/iso-box.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Russian
> > Cyrillic//EN//XML"
> > 
> > +        uri="ent/iso-cyr1.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Non-Russian
> > Cyrillic//EN//XML"
> > 
> > +        uri="ent/iso-cyr2.ent"/>
> > 
> > +
> > 
> > +<!-- End of catalog data for DocBook XML V4.2
> > ............................. -->
> > 
> > +<!--
> > ...................................................................
> > ... -->
> > 
> > +
> > 
> > +</catalog>
> > 
> > diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-
> > dtd4/catalogs/catalog-4.3.xml b/meta/recipes-devtools/docbook-
> > xml/docbook-xml-dtd4/catalogs/catalog-4.3.xml
> > 
> > new file mode 100644
> > 
> > index 0000000000..34d1afdd94
> > 
> > --- /dev/null
> > 
> > +++ b/meta/recipes-devtools/docbook-xml/docbook-xml-
> > dtd4/catalogs/catalog-4.3.xml
> > 
> > @@ -0,0 +1,115 @@
> > 
> > +<?xml version='1.0'?>
> > 
> > +<catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
> > 
> > +
> > 
> > +<!--
> > ...................................................................
> > ... -->
> > 
> > +<!-- XML Catalog data for DocBook XML V4.3
> > ................................ -->
> > 
> > +<!-- File catalog.xml
> > ..................................................... -->
> > 
> > +
> > 
> > +<!-- Please direct all questions, bug reports, or suggestions for
> > 
> > +     changes to the docbook@lists.oasis-open.org mailing list. For
> > more
> > 
> > +     information, see http://www.oasis-open.org/.
> > 
> > +  -->
> > 
> > +
> > 
> > +<!-- This is the catalog data file for DocBook V4.3. It is
> > provided as
> > 
> > +     a convenience in building your own catalog files. You need
> > not use
> > 
> > +     the filenames listed here, and need not use the filename
> > method of
> > 
> > +     identifying storage objects at all.  See the documentation
> > for
> > 
> > +     detailed information on the files associated with the DocBook
> > DTD.
> > 
> > +     See XML Catalogs at 
> > http://www.oasis-open.org/committees/entity/ for
> > 
> > +     detailed information on supplying and using catalog data.
> > 
> > +  -->
> > 
> > +
> > 
> > +<!--
> > ...................................................................
> > ... -->
> > 
> > +<!-- DocBook driver file
> > .................................................. -->
> > 
> > +
> > 
> > +<public publicId="-//OASIS//DTD DocBook XML V4.3//EN"
> > 
> > +        uri="docbookx.dtd"/>
> > 
> > +
> > 
> > +<!--
> > ...................................................................
> > ... -->
> > 
> > +<!-- DocBook modules
> > ...................................................... -->
> > 
> > +
> > 
> > +<public publicId="-//OASIS//DTD DocBook CALS Table Model V4.3//EN"
> > 
> > +        uri="calstblx.dtd"/>
> > 
> > +
> > 
> > +<public publicId="-//OASIS//DTD XML Exchange Table Model
> > 19990315//EN"
> > 
> > +        uri="soextblx.dtd"/>
> > 
> > +
> > 
> > +<public publicId="-//OASIS//ELEMENTS DocBook Information Pool
> > V4.3//EN"
> > 
> > +        uri="dbpoolx.mod"/>
> > 
> > +
> > 
> > +<public publicId="-//OASIS//ELEMENTS DocBook Document Hierarchy
> > V4.3//EN"
> > 
> > +        uri="dbhierx.mod"/>
> > 
> > +
> > 
> > +<public publicId="-//OASIS//ENTITIES DocBook Additional General
> > Entities V4.3//EN"
> > 
> > +        uri="dbgenent.mod"/>
> > 
> > +
> > 
> > +<public publicId="-//OASIS//ENTITIES DocBook Notations V4.3//EN"
> > 
> > +        uri="dbnotnx.mod"/>
> > 
> > +
> > 
> > +<public publicId="-//OASIS//ENTITIES DocBook Character Entities
> > V4.3//EN"
> > 
> > +        uri="dbcentx.mod"/>
> > 
> > +
> > 
> > +<!--
> > ...................................................................
> > ... -->
> > 
> > +<!-- ISO entity sets
> > ...................................................... -->
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Diacritical
> > Marks//EN//XML"
> > 
> > +        uri="ent/iso-dia.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Numeric and Special
> > Graphic//EN//XML"
> > 
> > +        uri="ent/iso-num.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Publishing//EN//XML"
> > 
> > +        uri="ent/iso-pub.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES General
> > Technical//EN//XML"
> > 
> > +        uri="ent/iso-tech.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Added Latin 1//EN//XML"
> > 
> > +        uri="ent/iso-lat1.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Added Latin 2//EN//XML"
> > 
> > +        uri="ent/iso-lat2.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Greek Letters//EN//XML"
> > 
> > +        uri="ent/iso-grk1.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Monotoniko
> > Greek//EN//XML"
> > 
> > +        uri="ent/iso-grk2.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Greek Symbols//EN//XML"
> > 
> > +        uri="ent/iso-grk3.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Alternative Greek
> > Symbols//EN//XML"
> > 
> > +        uri="ent/iso-grk4.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Arrow Relations//EN//XML"
> > 
> > +        uri="ent/iso-amsa.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Binary Operators//EN//XML"
> > 
> > +        uri="ent/iso-amsb.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Delimiters//EN//XML"
> > 
> > +        uri="ent/iso-amsc.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Negated Relations//EN//XML"
> > 
> > +        uri="ent/iso-amsn.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Ordinary//EN//XML"
> > 
> > +        uri="ent/iso-amso.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Relations//EN//XML"
> > 
> > +        uri="ent/iso-amsr.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Box and Line
> > Drawing//EN//XML"
> > 
> > +        uri="ent/iso-box.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Russian
> > Cyrillic//EN//XML"
> > 
> > +        uri="ent/iso-cyr1.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Non-Russian
> > Cyrillic//EN//XML"
> > 
> > +        uri="ent/iso-cyr2.ent"/>
> > 
> > +
> > 
> > +<!-- End of catalog data for DocBook XML V4.3
> > ............................. -->
> > 
> > +<!--
> > ...................................................................
> > ... -->
> > 
> > +
> > 
> > +</catalog>
> > 
> > diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-
> > dtd4/catalogs/catalog-4.4.xml b/meta/recipes-devtools/docbook-
> > xml/docbook-xml-dtd4/catalogs/catalog-4.4.xml
> > 
> > new file mode 100644
> > 
> > index 0000000000..8d709ba102
> > 
> > --- /dev/null
> > 
> > +++ b/meta/recipes-devtools/docbook-xml/docbook-xml-
> > dtd4/catalogs/catalog-4.4.xml
> > 
> > @@ -0,0 +1,124 @@
> > 
> > +<?xml version='1.0'?>
> > 
> > +<catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog"
> > prefer="public">
> > 
> > +
> > 
> > +<!--
> > ...................................................................
> > ... -->
> > 
> > +<!-- XML Catalog data for DocBook XML V4.4
> > ................................ -->
> > 
> > +<!-- File catalog.xml
> > ..................................................... -->
> > 
> > +
> > 
> > +<!-- Please direct all questions, bug reports, or suggestions for
> > 
> > +     changes to the docbook@lists.oasis-open.org mailing list. For
> > more
> > 
> > +     information, see http://www.oasis-open.org/.
> > 
> > +  -->
> > 
> > +
> > 
> > +<!-- This is the catalog data file for DocBook V4.4. It is
> > provided as
> > 
> > +     a convenience in building your own catalog files. You need
> > not use
> > 
> > +     the filenames listed here, and need not use the filename
> > method of
> > 
> > +     identifying storage objects at all.  See the documentation
> > for
> > 
> > +     detailed information on the files associated with the DocBook
> > DTD.
> > 
> > +     See XML Catalogs at 
> > http://www.oasis-open.org/committees/entity/ for
> > 
> > +     detailed information on supplying and using catalog data.
> > 
> > +  -->
> > 
> > +
> > 
> > +<!--
> > ...................................................................
> > ... -->
> > 
> > +<!-- DocBook driver file
> > .................................................. -->
> > 
> > +
> > 
> > +<public publicId="-//OASIS//DTD DocBook XML V4.4//EN"
> > 
> > +        uri="docbookx.dtd"/>
> > 
> > +
> > 
> > +<system systemId="
> > http://www.oasis-open.org/docbook/xml/4.4/docbookx.dtd"
> > 
> > +       uri="docbookx.dtd"/>
> > 
> > +
> > 
> > +<system systemId="http://docbook.org/xml/4.4/docbookx.dtd"
> > 
> > +       uri="docbookx.dtd"/>
> > 
> > +
> > 
> > +<!--
> > ...................................................................
> > ... -->
> > 
> > +<!-- DocBook modules
> > ...................................................... -->
> > 
> > +
> > 
> > +<public publicId="-//OASIS//DTD DocBook CALS Table Model V4.4//EN"
> > 
> > +        uri="calstblx.dtd"/>
> > 
> > +
> > 
> > +<public publicId="-//OASIS//ELEMENTS DocBook XML HTML Tables
> > V4.4//EN"
> > 
> > +       uri="htmltblx.mod"/>
> > 
> > +
> > 
> > +<public publicId="-//OASIS//DTD XML Exchange Table Model
> > 19990315//EN"
> > 
> > +        uri="soextblx.dtd"/>
> > 
> > +
> > 
> > +<public publicId="-//OASIS//ELEMENTS DocBook Information Pool
> > V4.4//EN"
> > 
> > +        uri="dbpoolx.mod"/>
> > 
> > +
> > 
> > +<public publicId="-//OASIS//ELEMENTS DocBook Document Hierarchy
> > V4.4//EN"
> > 
> > +        uri="dbhierx.mod"/>
> > 
> > +
> > 
> > +<public publicId="-//OASIS//ENTITIES DocBook Additional General
> > Entities V4.4//EN"
> > 
> > +        uri="dbgenent.mod"/>
> > 
> > +
> > 
> > +<public publicId="-//OASIS//ENTITIES DocBook Notations V4.4//EN"
> > 
> > +        uri="dbnotnx.mod"/>
> > 
> > +
> > 
> > +<public publicId="-//OASIS//ENTITIES DocBook Character Entities
> > V4.4//EN"
> > 
> > +        uri="dbcentx.mod"/>
> > 
> > +
> > 
> > +<!--
> > ...................................................................
> > ... -->
> > 
> > +<!-- ISO entity sets
> > ...................................................... -->
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Diacritical
> > Marks//EN//XML"
> > 
> > +        uri="ent/isodia.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Numeric and Special
> > Graphic//EN//XML"
> > 
> > +        uri="ent/isonum.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Publishing//EN//XML"
> > 
> > +        uri="ent/isopub.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES General
> > Technical//EN//XML"
> > 
> > +        uri="ent/isotech.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Added Latin 1//EN//XML"
> > 
> > +        uri="ent/isolat1.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Added Latin 2//EN//XML"
> > 
> > +        uri="ent/isolat2.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Greek Letters//EN//XML"
> > 
> > +        uri="ent/isogrk1.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Monotoniko
> > Greek//EN//XML"
> > 
> > +        uri="ent/isogrk2.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Greek Symbols//EN//XML"
> > 
> > +        uri="ent/isogrk3.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Alternative Greek
> > Symbols//EN//XML"
> > 
> > +        uri="ent/isogrk4.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Arrow Relations//EN//XML"
> > 
> > +        uri="ent/isoamsa.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Binary Operators//EN//XML"
> > 
> > +        uri="ent/isoamsb.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Delimiters//EN//XML"
> > 
> > +        uri="ent/isoamsc.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Negated Relations//EN//XML"
> > 
> > +        uri="ent/isoamsn.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Ordinary//EN//XML"
> > 
> > +        uri="ent/isoamso.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Relations//EN//XML"
> > 
> > +        uri="ent/isoamsr.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Box and Line
> > Drawing//EN//XML"
> > 
> > +        uri="ent/isobox.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Russian
> > Cyrillic//EN//XML"
> > 
> > +        uri="ent/isocyr1.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Non-Russian
> > Cyrillic//EN//XML"
> > 
> > +        uri="ent/isocyr2.ent"/>
> > 
> > +
> > 
> > +<!-- End of catalog data for DocBook XML V4.4
> > ............................. -->
> > 
> > +<!--
> > ...................................................................
> > ... -->
> > 
> > +
> > 
> > +</catalog>
> > 
> > diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-
> > dtd4/catalogs/catalog-4.5.xml b/meta/recipes-devtools/docbook-
> > xml/docbook-xml-dtd4/catalogs/catalog-4.5.xml
> > 
> > new file mode 100644
> > 
> > index 0000000000..f75c1d764d
> > 
> > --- /dev/null
> > 
> > +++ b/meta/recipes-devtools/docbook-xml/docbook-xml-
> > dtd4/catalogs/catalog-4.5.xml
> > 
> > @@ -0,0 +1,124 @@
> > 
> > +<?xml version='1.0'?>
> > 
> > +<catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog"
> > prefer="public">
> > 
> > +
> > 
> > +<!--
> > ...................................................................
> > ... -->
> > 
> > +<!-- XML Catalog data for DocBook XML V4.5
> > ................................ -->
> > 
> > +<!-- File catalog.xml
> > ..................................................... -->
> > 
> > +
> > 
> > +<!-- Please direct all questions, bug reports, or suggestions for
> > 
> > +     changes to the docbook@lists.oasis-open.org mailing list. For
> > more
> > 
> > +     information, see http://www.oasis-open.org/.
> > 
> > +  -->
> > 
> > +
> > 
> > +<!-- This is the catalog data file for DocBook V4.5. It is
> > provided as
> > 
> > +     a convenience in building your own catalog files. You need
> > not use
> > 
> > +     the filenames listed here, and need not use the filename
> > method of
> > 
> > +     identifying storage objects at all.  See the documentation
> > for
> > 
> > +     detailed information on the files associated with the DocBook
> > DTD.
> > 
> > +     See XML Catalogs at 
> > http://www.oasis-open.org/committees/entity/ for
> > 
> > +     detailed information on supplying and using catalog data.
> > 
> > +  -->
> > 
> > +
> > 
> > +<!--
> > ...................................................................
> > ... -->
> > 
> > +<!-- DocBook driver file
> > .................................................. -->
> > 
> > +
> > 
> > +<public publicId="-//OASIS//DTD DocBook XML V4.5//EN"
> > 
> > +        uri="docbookx.dtd"/>
> > 
> > +
> > 
> > +<system systemId="
> > http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd"
> > 
> > +       uri="docbookx.dtd"/>
> > 
> > +
> > 
> > +<system systemId="http://docbook.org/xml/4.5/docbookx.dtd"
> > 
> > +       uri="docbookx.dtd"/>
> > 
> > +
> > 
> > +<!--
> > ...................................................................
> > ... -->
> > 
> > +<!-- DocBook modules
> > ...................................................... -->
> > 
> > +
> > 
> > +<public publicId="-//OASIS//DTD DocBook CALS Table Model V4.5//EN"
> > 
> > +        uri="calstblx.dtd"/>
> > 
> > +
> > 
> > +<public publicId="-//OASIS//ELEMENTS DocBook XML HTML Tables
> > V4.5//EN"
> > 
> > +       uri="htmltblx.mod"/>
> > 
> > +
> > 
> > +<public publicId="-//OASIS//DTD XML Exchange Table Model
> > 19990315//EN"
> > 
> > +        uri="soextblx.dtd"/>
> > 
> > +
> > 
> > +<public publicId="-//OASIS//ELEMENTS DocBook Information Pool
> > V4.5//EN"
> > 
> > +        uri="dbpoolx.mod"/>
> > 
> > +
> > 
> > +<public publicId="-//OASIS//ELEMENTS DocBook Document Hierarchy
> > V4.5//EN"
> > 
> > +        uri="dbhierx.mod"/>
> > 
> > +
> > 
> > +<public publicId="-//OASIS//ENTITIES DocBook Additional General
> > Entities V4.5//EN"
> > 
> > +        uri="dbgenent.mod"/>
> > 
> > +
> > 
> > +<public publicId="-//OASIS//ENTITIES DocBook Notations V4.5//EN"
> > 
> > +        uri="dbnotnx.mod"/>
> > 
> > +
> > 
> > +<public publicId="-//OASIS//ENTITIES DocBook Character Entities
> > V4.5//EN"
> > 
> > +        uri="dbcentx.mod"/>
> > 
> > +
> > 
> > +<!--
> > ...................................................................
> > ... -->
> > 
> > +<!-- ISO entity sets
> > ...................................................... -->
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Diacritical
> > Marks//EN//XML"
> > 
> > +        uri="ent/isodia.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Numeric and Special
> > Graphic//EN//XML"
> > 
> > +        uri="ent/isonum.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Publishing//EN//XML"
> > 
> > +        uri="ent/isopub.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES General
> > Technical//EN//XML"
> > 
> > +        uri="ent/isotech.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Added Latin 1//EN//XML"
> > 
> > +        uri="ent/isolat1.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Added Latin 2//EN//XML"
> > 
> > +        uri="ent/isolat2.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Greek Letters//EN//XML"
> > 
> > +        uri="ent/isogrk1.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Monotoniko
> > Greek//EN//XML"
> > 
> > +        uri="ent/isogrk2.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Greek Symbols//EN//XML"
> > 
> > +        uri="ent/isogrk3.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Alternative Greek
> > Symbols//EN//XML"
> > 
> > +        uri="ent/isogrk4.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Arrow Relations//EN//XML"
> > 
> > +        uri="ent/isoamsa.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Binary Operators//EN//XML"
> > 
> > +        uri="ent/isoamsb.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Delimiters//EN//XML"
> > 
> > +        uri="ent/isoamsc.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Negated Relations//EN//XML"
> > 
> > +        uri="ent/isoamsn.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Ordinary//EN//XML"
> > 
> > +        uri="ent/isoamso.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Relations//EN//XML"
> > 
> > +        uri="ent/isoamsr.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Box and Line
> > Drawing//EN//XML"
> > 
> > +        uri="ent/isobox.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Russian
> > Cyrillic//EN//XML"
> > 
> > +        uri="ent/isocyr1.ent"/>
> > 
> > +
> > 
> > +<public publicId="ISO 8879:1986//ENTITIES Non-Russian
> > Cyrillic//EN//XML"
> > 
> > +        uri="ent/isocyr2.ent"/>
> > 
> > +
> > 
> > +<!-- End of catalog data for DocBook XML V4.5
> > ............................. -->
> > 
> > +<!--
> > ...................................................................
> > ... -->
> > 
> > +
> > 
> > +</catalog>
> > 
> > diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-
> > dtd4/docbook-xml-update-catalog.xml.patch b/meta/recipes-
> > devtools/docbook-xml/docbook-xml-dtd4/docbook-xml-update-
> > catalog.xml.patch
> > 
> > deleted file mode 100644
> > 
> > index 59703609ca..0000000000
> > 
> > --- a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-
> > xml-update-catalog.xml.patch
> > 
> > +++ /dev/null
> > 
> > @@ -1,515 +0,0 @@
> > 
> > -docbook-xml: update catalog.xml
> > 
> > -
> > 
> > -Refer Ubuntu 13.04 to update catalog.xml
> > 
> > -
> > 
> > -Upstream-Status: Pending
> > 
> > -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > 
> > ----
> > 
> > - docbook-4.0/catalog.xml   | 72
> > +++++++++++++++++++++++++++++++++++++++++++++++
> > 
> > - docbook-4.1.2/catalog.xml | 66
> > +++++++++++++++++++++++++++++++++++++++++++
> > 
> > - docbook-4.2/catalog.xml   | 69 ++++++--------------------------
> > -------------
> > 
> > - docbook-4.3/catalog.xml   | 72 ++++++++------------------------
> > ---------------
> > 
> > - docbook-4.4/catalog.xml   | 63 ++------------------------------
> > ---------
> > 
> > - docbook-4.5/catalog.xml   | 63 ++------------------------------
> > ---------
> > 
> > - 6 files changed, 165 insertions(+), 240 deletions(-)
> > 
> > - create mode 100644 docbook-4.0/catalog.xml
> > 
> > - create mode 100644 docbook-4.1.2/catalog.xml
> > 
> > -
> > 
> > -diff --git a/docbook-4.0/catalog.xml b/docbook-4.0/catalog.xml
> > 
> > -new file mode 100644
> > 
> > ---- /dev/null
> > 
> > -+++ b/docbook-4.0/catalog.xml
> > 
> > -@@ -0,0 +1,72 @@
> > 
> > -+<?xml version='1.0'?>
> > 
> > -+<!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML
> > Catalog V1.0//EN" 
> > 
> > -+    "
> > http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd
> > ">
> > 
> > -+
> > 
> > -+<catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
> > 
> > -+
> > 
> > -+<!--
> > ...................................................................
> > ... -->
> > 
> > -+<!-- XML Catalog data for DocBook XML
> > V4.0............................... -->
> > 
> > -+<!-- File catalog.xml
> > ..................................................... -->
> > 
> > -+
> > 
> > -+<!-- Please direct all questions, bug reports, or suggestions for
> > 
> > -+     changes to the docbook@lists.oasis-open.org mailing list.
> > For more
> > 
> > -+     information, see http://www.oasis-open.org/.
> > 
> > -+  -->
> > 
> > -+
> > 
> > -+<!-- This is the catalog data file for DocBook V4.0. It is
> > provided as
> > 
> > -+     a convenience in building your own catalog files. You need
> > not use
> > 
> > -+     the filenames listed here, and need not use the filename
> > method of
> > 
> > -+     identifying storage objects at all.  See the documentation
> > for
> > 
> > -+     detailed information on the files associated with the
> > DocBook DTD.
> > 
> > -+     See XML Catalogs at 
> > http://www.oasis-open.org/committees/entity/ for
> > 
> > -+     detailed information on supplying and using catalog data.
> > 
> > -+  -->
> > 
> > -+
> > 
> > -+<!--
> > ...................................................................
> > ... -->
> > 
> > -+<!-- DocBook driver file
> > .................................................. -->
> > 
> > -+
> > 
> > -+<public publicId="-//Norman Walsh//DTD DocBk XML V4.0//EN"
> > 
> > -+        uri="docbookx.dtd"/>
> > 
> > -+
> > 
> > -+<!-- Other ways to refer to DocBook XML
> > v4.0............................... -->
> > 
> > -+<public publicId="-//Norman Walsh//DTD DocBook XML V4.0//EN"
> > 
> > -+        uri="docbookx.dtd"/>
> > 
> > -+
> > 
> > -+<system systemId="
> > http://www.oasis-open.org/docbook/xml/4.0/docbookx.dtd"
> > 
> > -+        uri="docbookx.dtd"/>
> > 
> > -+
> > 
> > -+<!--
> > ...................................................................
> > ... -->
> > 
> > -+<!-- DocBook modules
> > ...................................................... -->
> > 
> > -+
> > 
> > -+<public publicId="-//Norman Walsh//ENTITIES DocBook XML Notations
> > V4.0//EN"
> > 
> > -+        uri="dbnotnx.mod"/>
> > 
> > -+
> > 
> > -+<public publicId="-//Norman Walsh//ENTITIES DocBook XML Character
> > Entities V4.0//EN"
> > 
> > -+        uri="dbcentx.mod"/>
> > 
> > -+
> > 
> > -+<public publicId="-//Norman Walsh//ELEMENTS DocBook XML
> > Information Pool V4.0//EN"
> > 
> > -+        uri="dbpoolx.mod"/>
> > 
> > -+
> > 
> > -+<public publicId="-//Norman Walsh//ELEMENTS DocBook XML Document
> > Hierarchy V4.0//EN"
> > 
> > -+        uri="dbhierx.mod"/>
> > 
> > -+
> > 
> > -+<public publicId="-//Norman Walsh//ENTITIES DocBook XML
> > Additional General Entities V4.0//EN"
> > 
> > -+        uri="dbgenent.mod"/>
> > 
> > -+
> > 
> > -+<public publicId="-//Norman Walsh//DTD CALS Table Model XML
> > V4.0//EN"
> > 
> > -+        uri="calstblx.dtd"/>
> > 
> > -+
> > 
> > -+<!-- UNOFFICIAL conversion of the exchange table model to XML,
> > based on the OASIS Exchange -->
> > 
> > -+<!--    Table Model PUBLIC "-//SGML Open//DTD Exchange Table
> > Model 19960430//EN"           -->
> > 
> > -+<public publicId="-//Normal Walsh//Exchange Table Model 19960430
> > XML V4.0//EN"
> > 
> > -+        uri="soextblx.dtd"/>
> > 
> > -+
> > 
> > -+<!-- the following FPI is declared for the DTD inside the DTD,
> > but we'll -->
> > 
> > -+<!-- use the version from the latest DocBook
> > 
> > -+<public publicId="-//OASIS//DTD XML Exchange Table Model
> > 19990315//EN"
> > 
> > -+        uri="soextblx.dtd"/> -->
> > 
> > -+
> > 
> > -+<!-- End of catalog data for DocBook XML V4.0
> > ............................. -->
> > 
> > -+<!--
> > ...................................................................
> > ... -->
> > 
> > -+
> > 
> > -+</catalog>
> > 
> > -diff --git a/docbook-4.1.2/catalog.xml b/docbook-4.1.2/catalog.xml
> > 
> > -new file mode 100644
> > 
> > ---- /dev/null
> > 
> > -+++ b/docbook-4.1.2/catalog.xml
> > 
> > -@@ -0,0 +1,66 @@
> > 
> > -+<?xml version='1.0'?>
> > 
> > -+<!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML
> > Catalog V1.0//EN" 
> > 
> > -+    "
> > http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd
> > ">
> > 
> > -+
> > 
> > -+<catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
> > 
> > -+
> > 
> > -+<!--
> > ...................................................................
> > ... -->
> > 
> > -+<!-- XML Catalog data for DocBook XML
> > V4.1.2............................... -->
> > 
> > -+<!-- File catalog.xml
> > ..................................................... -->
> > 
> > -+
> > 
> > -+<!-- Please direct all questions, bug reports, or suggestions for
> > 
> > -+     changes to the docbook@lists.oasis-open.org mailing list.
> > For more
> > 
> > -+     information, see http://www.oasis-open.org/.
> > 
> > -+  -->
> > 
> > -+
> > 
> > -+<!-- This is the catalog data file for DocBook V4.1.2. It is
> > provided as
> > 
> > -+     a convenience in building your own catalog files. You need
> > not use
> > 
> > -+     the filenames listed here, and need not use the filename
> > method of
> > 
> > -+     identifying storage objects at all.  See the documentation
> > for
> > 
> > -+     detailed information on the files associated with the
> > DocBook DTD.
> > 
> > -+     See XML Catalogs at 
> > http://www.oasis-open.org/committees/entity/ for
> > 
> > -+     detailed information on supplying and using catalog data.
> > 
> > -+  -->
> > 
> > -+
> > 
> > -+<!--
> > ...................................................................
> > ... -->
> > 
> > -+<!-- DocBook driver file
> > .................................................. -->
> > 
> > -+
> > 
> > -+<public publicId="-//OASIS//DTD DocBook XML V4.1.2//EN"
> > 
> > -+        uri="docbookx.dtd"/>
> > 
> > -+
> > 
> > -+<system systemId="
> > http://www.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd"
> > 
> > -+        uri="docbookx.dtd"/>
> > 
> > -+
> > 
> > -+<system systemId="http://docbook.org/xml/4.1.2/docbookx.dtd"
> > 
> > -+        uri="docbookx.dtd"/>
> > 
> > -+
> > 
> > -+<!--
> > ...................................................................
> > ... -->
> > 
> > -+<!-- DocBook modules
> > ...................................................... -->
> > 
> > -+
> > 
> > -+<public publicId="-//OASIS//DTD DocBook CALS Table Model
> > V4.1.2//EN"
> > 
> > -+        uri="calstblx.dtd"/>
> > 
> > -+
> > 
> > -+  <!-- already included in docbook 4.2
> > 
> > -+<public publicId="-//OASIS//DTD XML Exchange Table Model
> > 19990315//EN"
> > 
> > -+        uri="soextblx.dtd"/> -->
> > 
> > -+
> > 
> > -+<public publicId="-//OASIS//ELEMENTS DocBook XML Information Pool
> > V4.1.2//EN"
> > 
> > -+        uri="dbpoolx.mod"/>
> > 
> > -+
> > 
> > -+<public publicId="-//OASIS//ELEMENTS DocBook Document Hierarchy
> > V4.1.2//EN"
> > 
> > -+        uri="dbhierx.mod"/>
> > 
> > -+
> > 
> > -+<public publicId="-//OASIS//ENTITIES DocBook Additional General
> > Entities V4.1.2//EN"
> > 
> > -+        uri="dbgenent.mod"/>
> > 
> > -+
> > 
> > -+<public publicId="-//OASIS//ENTITIES DocBook Notations
> > V4.1.2//EN"
> > 
> > -+        uri="dbnotnx.mod"/>
> > 
> > -+
> > 
> > -+<public publicId="-//OASIS//ENTITIES DocBook Character Entities
> > V4.1.2//EN"
> > 
> > -+        uri="dbcentx.mod"/>
> > 
> > -+
> > 
> > -+
> > 
> > -+<!-- End of catalog data for DocBook XML V4.1.2
> > ............................. -->
> > 
> > -+<!--
> > ...................................................................
> > ... -->
> > 
> > -+
> > 
> > -+</catalog>
> > 
> > -diff --git a/docbook-4.2/catalog.xml b/docbook-4.2/catalog.xml
> > 
> > ---- a/docbook-4.2/catalog.xml
> > 
> > -+++ b/docbook-4.2/catalog.xml
> > 
> > -@@ -1,4 +1,7 @@
> > 
> > - <?xml version='1.0'?>
> > 
> > -+<!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML
> > Catalog V1.0//EN"
> > 
> > -+    "
> > http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd
> > ">
> > 
> > -+
> > 
> > - <catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
> > 
> > - 
> > 
> > - <!--
> > ...................................................................
> > ... -->
> > 
> > -@@ -25,6 +28,12 @@
> > 
> > - <public publicId="-//OASIS//DTD DocBook XML V4.2//EN"
> > 
> > -         uri="docbookx.dtd"/>
> > 
> > - 
> > 
> > -+<system systemId="
> > http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
> > 
> > -+        uri="docbookx.dtd"/>
> > 
> > -+
> > 
> > -+<system systemId="http://docbook.org/xml/4.2/docbookx.dtd"
> > 
> > -+        uri="docbookx.dtd"/>
> > 
> > -+
> > 
> > - <!--
> > ...................................................................
> > ... -->
> > 
> > - <!-- DocBook modules
> > ...................................................... -->
> > 
> > - 
> > 
> > -@@ -49,66 +58,6 @@
> > 
> > - <public publicId="-//OASIS//ENTITIES DocBook Character Entities
> > V4.2//EN"
> > 
> > -         uri="dbcentx.mod"/>
> > 
> > - 
> > 
> > --<!--
> > ...................................................................
> > ... -->
> > 
> > --<!-- ISO entity sets
> > ...................................................... -->
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Diacritical
> > Marks//EN//XML"
> > 
> > --        uri="ent/iso-dia.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Numeric and Special
> > Graphic//EN//XML"
> > 
> > --        uri="ent/iso-num.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Publishing//EN//XML"
> > 
> > --        uri="ent/iso-pub.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES General
> > Technical//EN//XML"
> > 
> > --        uri="ent/iso-tech.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Added Latin 1//EN//XML"
> > 
> > --        uri="ent/iso-lat1.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Added Latin 2//EN//XML"
> > 
> > --        uri="ent/iso-lat2.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Greek Letters//EN//XML"
> > 
> > --        uri="ent/iso-grk1.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Monotoniko
> > Greek//EN//XML"
> > 
> > --        uri="ent/iso-grk2.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Greek Symbols//EN//XML"
> > 
> > --        uri="ent/iso-grk3.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Alternative Greek
> > Symbols//EN//XML"
> > 
> > --        uri="ent/iso-grk4.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Arrow Relations//EN//XML"
> > 
> > --        uri="ent/iso-amsa.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Binary Operators//EN//XML"
> > 
> > --        uri="ent/iso-amsb.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Delimiters//EN//XML"
> > 
> > --        uri="ent/iso-amsc.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Negated Relations//EN//XML"
> > 
> > --        uri="ent/iso-amsn.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Ordinary//EN//XML"
> > 
> > --        uri="ent/iso-amso.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Relations//EN//XML"
> > 
> > --        uri="ent/iso-amsr.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Box and Line
> > Drawing//EN//XML"
> > 
> > --        uri="ent/iso-box.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Russian
> > Cyrillic//EN//XML"
> > 
> > --        uri="ent/iso-cyr1.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Non-Russian
> > Cyrillic//EN//XML"
> > 
> > --        uri="ent/iso-cyr2.ent"/>
> > 
> > --
> > 
> > - <!-- End of catalog data for DocBook XML V4.2
> > ............................. -->
> > 
> > - <!--
> > ...................................................................
> > ... -->
> > 
> > - 
> > 
> > -diff --git a/docbook-4.3/catalog.xml b/docbook-4.3/catalog.xml
> > 
> > ---- a/docbook-4.3/catalog.xml
> > 
> > -+++ b/docbook-4.3/catalog.xml
> > 
> > -@@ -1,4 +1,7 @@
> > 
> > - <?xml version='1.0'?>
> > 
> > -+<!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML
> > Catalog V1.0//EN"
> > 
> > -+    "
> > http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd
> > ">
> > 
> > -+
> > 
> > - <catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
> > 
> > - 
> > 
> > - <!--
> > ...................................................................
> > ... -->
> > 
> > -@@ -25,12 +28,21 @@
> > 
> > - <public publicId="-//OASIS//DTD DocBook XML V4.3//EN"
> > 
> > -         uri="docbookx.dtd"/>
> > 
> > - 
> > 
> > -+<system systemId="
> > http://www.oasis-open.org/docbook/xml/4.3/docbookx.dtd"
> > 
> > -+        uri="docbookx.dtd"/>
> > 
> > -+
> > 
> > -+<system systemId="http://docbook.org/xml/4.3/docbookx.dtd"
> > 
> > -+        uri="docbookx.dtd"/>
> > 
> > -+
> > 
> > - <!--
> > ...................................................................
> > ... -->
> > 
> > - <!-- DocBook modules
> > ...................................................... -->
> > 
> > - 
> > 
> > - <public publicId="-//OASIS//DTD DocBook CALS Table Model
> > V4.3//EN"
> > 
> > -         uri="calstblx.dtd"/>
> > 
> > - 
> > 
> > -+<public publicId="-//OASIS//ELEMENTS DocBook XML HTML Tables
> > V4.3//EN"
> > 
> > -+        uri="htmltblx.mod"/>
> > 
> > -+
> > 
> > - <public publicId="-//OASIS//DTD XML Exchange Table Model
> > 19990315//EN"
> > 
> > -         uri="soextblx.dtd"/>
> > 
> > - 
> > 
> > -@@ -49,66 +61,6 @@
> > 
> > - <public publicId="-//OASIS//ENTITIES DocBook Character Entities
> > V4.3//EN"
> > 
> > -         uri="dbcentx.mod"/>
> > 
> > - 
> > 
> > --<!--
> > ...................................................................
> > ... -->
> > 
> > --<!-- ISO entity sets
> > ...................................................... -->
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Diacritical
> > Marks//EN//XML"
> > 
> > --        uri="ent/iso-dia.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Numeric and Special
> > Graphic//EN//XML"
> > 
> > --        uri="ent/iso-num.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Publishing//EN//XML"
> > 
> > --        uri="ent/iso-pub.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES General
> > Technical//EN//XML"
> > 
> > --        uri="ent/iso-tech.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Added Latin 1//EN//XML"
> > 
> > --        uri="ent/iso-lat1.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Added Latin 2//EN//XML"
> > 
> > --        uri="ent/iso-lat2.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Greek Letters//EN//XML"
> > 
> > --        uri="ent/iso-grk1.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Monotoniko
> > Greek//EN//XML"
> > 
> > --        uri="ent/iso-grk2.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Greek Symbols//EN//XML"
> > 
> > --        uri="ent/iso-grk3.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Alternative Greek
> > Symbols//EN//XML"
> > 
> > --        uri="ent/iso-grk4.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Arrow Relations//EN//XML"
> > 
> > --        uri="ent/iso-amsa.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Binary Operators//EN//XML"
> > 
> > --        uri="ent/iso-amsb.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Delimiters//EN//XML"
> > 
> > --        uri="ent/iso-amsc.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Negated Relations//EN//XML"
> > 
> > --        uri="ent/iso-amsn.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Ordinary//EN//XML"
> > 
> > --        uri="ent/iso-amso.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Relations//EN//XML"
> > 
> > --        uri="ent/iso-amsr.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Box and Line
> > Drawing//EN//XML"
> > 
> > --        uri="ent/iso-box.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Russian
> > Cyrillic//EN//XML"
> > 
> > --        uri="ent/iso-cyr1.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Non-Russian
> > Cyrillic//EN//XML"
> > 
> > --        uri="ent/iso-cyr2.ent"/>
> > 
> > --
> > 
> > - <!-- End of catalog data for DocBook XML V4.3
> > ............................. -->
> > 
> > - <!--
> > ...................................................................
> > ... -->
> > 
> > - 
> > 
> > -diff --git a/docbook-4.4/catalog.xml b/docbook-4.4/catalog.xml
> > 
> > ---- a/docbook-4.4/catalog.xml
> > 
> > -+++ b/docbook-4.4/catalog.xml
> > 
> > -@@ -1,4 +1,7 @@
> > 
> > - <?xml version='1.0'?>
> > 
> > -+<!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML
> > Catalog V1.0//EN"
> > 
> > -+    "
> > http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd
> > ">
> > 
> > -+
> > 
> > - <catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog"
> > prefer="public">
> > 
> > - 
> > 
> > - <!--
> > ...................................................................
> > ... -->
> > 
> > -@@ -58,66 +61,6 @@
> > 
> > - <public publicId="-//OASIS//ENTITIES DocBook Character Entities
> > V4.4//EN"
> > 
> > -         uri="dbcentx.mod"/>
> > 
> > - 
> > 
> > --<!--
> > ...................................................................
> > ... -->
> > 
> > --<!-- ISO entity sets
> > ...................................................... -->
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Diacritical
> > Marks//EN//XML"
> > 
> > --        uri="ent/isodia.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Numeric and Special
> > Graphic//EN//XML"
> > 
> > --        uri="ent/isonum.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Publishing//EN//XML"
> > 
> > --        uri="ent/isopub.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES General
> > Technical//EN//XML"
> > 
> > --        uri="ent/isotech.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Added Latin 1//EN//XML"
> > 
> > --        uri="ent/isolat1.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Added Latin 2//EN//XML"
> > 
> > --        uri="ent/isolat2.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Greek Letters//EN//XML"
> > 
> > --        uri="ent/isogrk1.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Monotoniko
> > Greek//EN//XML"
> > 
> > --        uri="ent/isogrk2.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Greek Symbols//EN//XML"
> > 
> > --        uri="ent/isogrk3.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Alternative Greek
> > Symbols//EN//XML"
> > 
> > --        uri="ent/isogrk4.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Arrow Relations//EN//XML"
> > 
> > --        uri="ent/isoamsa.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Binary Operators//EN//XML"
> > 
> > --        uri="ent/isoamsb.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Delimiters//EN//XML"
> > 
> > --        uri="ent/isoamsc.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Negated Relations//EN//XML"
> > 
> > --        uri="ent/isoamsn.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Ordinary//EN//XML"
> > 
> > --        uri="ent/isoamso.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Relations//EN//XML"
> > 
> > --        uri="ent/isoamsr.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Box and Line
> > Drawing//EN//XML"
> > 
> > --        uri="ent/isobox.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Russian
> > Cyrillic//EN//XML"
> > 
> > --        uri="ent/isocyr1.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Non-Russian
> > Cyrillic//EN//XML"
> > 
> > --        uri="ent/isocyr2.ent"/>
> > 
> > --
> > 
> > - <!-- End of catalog data for DocBook XML V4.4
> > ............................. -->
> > 
> > - <!--
> > ...................................................................
> > ... -->
> > 
> > - 
> > 
> > -diff --git a/docbook-4.5/catalog.xml b/docbook-4.5/catalog.xml
> > 
> > ---- a/docbook-4.5/catalog.xml
> > 
> > -+++ b/docbook-4.5/catalog.xml
> > 
> > -@@ -1,4 +1,7 @@
> > 
> > - <?xml version='1.0'?>
> > 
> > -+<!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML
> > Catalog V1.0//EN"
> > 
> > -+    "
> > http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd
> > ">
> > 
> > -+
> > 
> > - <catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog"
> > prefer="public">
> > 
> > - 
> > 
> > - <!--
> > ...................................................................
> > ... -->
> > 
> > -@@ -58,66 +61,6 @@
> > 
> > - <public publicId="-//OASIS//ENTITIES DocBook Character Entities
> > V4.5//EN"
> > 
> > -         uri="dbcentx.mod"/>
> > 
> > - 
> > 
> > --<!--
> > ...................................................................
> > ... -->
> > 
> > --<!-- ISO entity sets
> > ...................................................... -->
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Diacritical
> > Marks//EN//XML"
> > 
> > --        uri="ent/isodia.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Numeric and Special
> > Graphic//EN//XML"
> > 
> > --        uri="ent/isonum.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Publishing//EN//XML"
> > 
> > --        uri="ent/isopub.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES General
> > Technical//EN//XML"
> > 
> > --        uri="ent/isotech.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Added Latin 1//EN//XML"
> > 
> > --        uri="ent/isolat1.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Added Latin 2//EN//XML"
> > 
> > --        uri="ent/isolat2.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Greek Letters//EN//XML"
> > 
> > --        uri="ent/isogrk1.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Monotoniko
> > Greek//EN//XML"
> > 
> > --        uri="ent/isogrk2.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Greek Symbols//EN//XML"
> > 
> > --        uri="ent/isogrk3.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Alternative Greek
> > Symbols//EN//XML"
> > 
> > --        uri="ent/isogrk4.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Arrow Relations//EN//XML"
> > 
> > --        uri="ent/isoamsa.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Binary Operators//EN//XML"
> > 
> > --        uri="ent/isoamsb.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Delimiters//EN//XML"
> > 
> > --        uri="ent/isoamsc.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Negated Relations//EN//XML"
> > 
> > --        uri="ent/isoamsn.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Ordinary//EN//XML"
> > 
> > --        uri="ent/isoamso.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> > Relations//EN//XML"
> > 
> > --        uri="ent/isoamsr.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Box and Line
> > Drawing//EN//XML"
> > 
> > --        uri="ent/isobox.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Russian
> > Cyrillic//EN//XML"
> > 
> > --        uri="ent/isocyr1.ent"/>
> > 
> > --
> > 
> > --<public publicId="ISO 8879:1986//ENTITIES Non-Russian
> > Cyrillic//EN//XML"
> > 
> > --        uri="ent/isocyr2.ent"/>
> > 
> > --
> > 
> > - <!-- End of catalog data for DocBook XML V4.5
> > ............................. -->
> > 
> > - <!--
> > ...................................................................
> > ... -->
> > 
> > - 
> > 
> > --- 
> > 
> > -1.8.1.2
> > 
> > -
> > 
> > diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-
> > dtd4_4.5.bb b/meta/recipes-devtools/docbook-xml/docbook-xml-
> > dtd4_4.5.bb
> > 
> > index 6452c8d99f..786ca5418f 100644
> > 
> > --- a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
> > 
> > +++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
> > 
> > @@ -1,9 +1,10 @@
> > 
> >  SUMMARY = "Document type definitions for verification of XML data
> > files"
> > 
> >  DESCRIPTION = "Document type definitions for verification of XML
> > data \
> > 
> > -files against the DocBook rule set, it ships with the latest
> > DocBook 4.5 \
> > 
> > -XML DTD, as well as a selected set of legacy DTDs for use with
> > older \
> > 
> > -documents, including 4.0, 4.1.2, 4.2, 4.3 and 4.4"
> > 
> > -HOMEPAGE = "http://www.docbook.org/xml/"
> > 
> > +files against the DocBook rule set. It ships with the latest
> > DocBook 4.5 \
> > 
> > +XML DTD, together with older version 4.2, 4.3 and 4.4."
> > 
> > +HOMEPAGE = "https://www.docbook.org/xml/"
> > 
> > +
> > 
> > +PR = "r1"
> > 
> > 
> > 
> >  LICENSE = "OASIS"
> > 
> >  LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE-
> > OASIS;md5=c608985dd5f7f215e669e7639a0b1d2e"
> > 
> > @@ -11,42 +12,37 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE-
> > OASIS;md5=c608985dd5f7f215e669e763
> > 
> >  # Note: the upstream sources are not distributed with a license
> > file.
> > 
> >  # LICENSE-OASIS is included as a "patch" to workaround this. When
> > 
> >  # upgrading this recipe, please verify whether this is still
> > needed.
> > 
> > -SRC_URI = "
> > http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/d/docbook-xml/docbook-xml_${PV}.orig.tar.gz
> > \
> > 
> > -           file://LICENSE-OASIS \
> > 
> > -           file://docbook-xml-update-catalog.xml.patch \
> > 
> > +SRC_URI = "\
> > 
> > +    file://LICENSE-OASIS \
> > 
> > +    file://catalogs/* \
> > 
> >  "
> > 
> > 
> > 
> > -SRC_URI[md5sum] = "487b4d44e15cffb1f4048af23f98208e"
> > 
> > -SRC_URI[sha256sum] =
> > "b0f8edcf697f5318e63dd98c9a931f3fee167af0805ba441db372e0f17b2a44f"
> > 
> > -
> > 
> > -UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/docbook-xml/"
> > 
> > -
> > 
> > -S = "${WORKDIR}/docbook-xml-4.5.c31424"
> > 
> > -
> > 
> > -inherit allarch
> > 
> > +inherit allarch xmlcatalog
> > 
> >  BBCLASSEXTEND = "native"
> > 
> > 
> > 
> > -do_configure (){
> > 
> > -    :
> > 
> > -}
> > 
> > +# the XMLCATALOGS variable is used in xmlcatalog BB class
> > 
> > +XMLCATALOGS = "${sysconfdir}/xml/docbook-xml.xml"
> > 
> > 
> > 
> > -do_compile (){
> > 
> > -    :
> > 
> > -}
> > 
> > +S = "${WORKDIR}"
> > 
> > +
> > 
> > +do_configure[noexec] = "1"
> > 
> > +do_compile[noexec] = "1"
> > 
> > 
> > 
> >  do_install () {
> > 
> > +
> > 
> >      install -d ${D}${sysconfdir}/xml/
> > 
> >      xmlcatalog --create --noout ${D}${sysconfdir}/xml/docbook-
> > xml.xml
> > 
> > 
> > 
> > -    for DTDVERSION in 4.0 4.1.2 4.2 4.3 4.4 4.5; do
> > 
> > -        DEST=${datadir}/xml/docbook/schema/dtd/$DTDVERSION
> > 
> > +    for catalog in $(ls catalogs); do
> > 
> > +        dtdVersion=$(echo ${catalog} | sed -rn 's/^catalog-([0-
> > 9].[0-9])\.xml/\1/p')
> > 
> > +        DEST=${datadir}/xml/docbook/schema/dtd/${dtdVersion}
> > 
> >          install -d -m 755 ${D}$DEST
> > 
> > -        cp -v -R docbook-$DTDVERSION/* ${D}$DEST
> > 
> > +        cp -v -R catalogs/catalog-${dtdVersion}.xml
> > ${D}$DEST/catalog.xml
> > 
> >          xmlcatalog --verbose --noout --add nextCatalog unused
> > file://$DEST/catalog.xml ${D}${sysconfdir}/xml/docbook-xml.xml
> > 
> >      done
> > 
> >  }
> > 
> > 
> > 
> > -XMLCATALOGS = "${sysconfdir}/xml/docbook-xml.xml"
> > 
> > -inherit xmlcatalog
> > 
> > -
> > 
> > -FILES_${PN} = "${datadir}/* ${sysconfdir}/xml/docbook-xml.xml"
> > 
> > +FILES_${PN} = "\
> > 
> > +    ${datadir}/* \
> > 
> > +    ${XMLCATALOGS} \
> > 
> > +"
> > 

--=-pgRf8N/wtfiSNz83VVLW
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>Yes I think so. I supposed that if there's only 4 catalogs it can =
be done this way but if the policy is to download everything then OK - I'll=
 rewrite the recipe, hope this time finally well.</div><div><br></div><div>=
G.</div><div><br></div><div>On Sat, 2020-05-23 at 20:50 +0200, Alexander Ka=
navin wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; bor=
der-left:2px #729fcf solid;padding-left:1ex"><div dir=3D"ltr"><div>Can the =
original source be fetched though? Copying things over into the layer itsel=
f is not the best option.</div><div><br></div><div>Alex<br></div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, 23=
 May 2020 at 19:20, Gregor Zatko &lt;<a href=3D"mailto:gzatko@gmail.com">gz=
atko@gmail.com</a>&gt; wrote:<br></div><blockquote type=3D"cite" style=3D"m=
argin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex">From: Gre=
gor Zatko &lt;<a href=3D"mailto:gzatko@zoznam.sk" target=3D"_blank">gzatko@=
zoznam.sk</a>&gt;<br>
<br>
Until now a Debian package has been used as a source.<br>
This change just switches it to project's upstream.<br>
<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13270" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D13270</a><br>
<br>
Signed-off-by: Gregor Zatko &lt;<a href=3D"mailto:gzatko@gmail.com" target=
=3D"_blank">gzatko@gmail.com</a>&gt;<br>
---<br>
&nbsp;.../docbook-xml-dtd4/catalogs/catalog-4.2.xml | 115 ++++<br>
&nbsp;.../docbook-xml-dtd4/catalogs/catalog-4.3.xml | 115 ++++<br>
&nbsp;.../docbook-xml-dtd4/catalogs/catalog-4.4.xml | 124 +++++<br>
&nbsp;.../docbook-xml-dtd4/catalogs/catalog-4.5.xml | 124 +++++<br>
&nbsp;.../docbook-xml-update-catalog.xml.patch&nbsp; &nbsp; &nbsp; | 515 --=
----------------<br>
&nbsp;.../docbook-xml/<a href=3D"http://docbook-xml-dtd4_4.5.bb" rel=3D"nor=
eferrer" target=3D"_blank">docbook-xml-dtd4_4.5.bb</a>&nbsp; &nbsp; &nbsp; =
&nbsp;|&nbsp; 52 +-<br>
&nbsp;6 files changed, 502 insertions(+), 543 deletions(-)<br>
&nbsp;create mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-dtd4=
/catalogs/catalog-4.2.xml<br>
&nbsp;create mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-dtd4=
/catalogs/catalog-4.3.xml<br>
&nbsp;create mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-dtd4=
/catalogs/catalog-4.4.xml<br>
&nbsp;create mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-dtd4=
/catalogs/catalog-4.5.xml<br>
&nbsp;delete mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-dtd4=
/docbook-xml-update-catalog.xml.patch<br>
<br>
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/ca=
talog-4.2.xml b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs=
/catalog-4.2.xml<br>
new file mode 100644<br>
index 0000000000..6920c2f7e0<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-4=
.2.xml<br>
@@ -0,0 +1,115 @@<br>
+&lt;?xml version=3D'1.0'?&gt;<br>
+&lt;catalog xmlns=3D"urn:oasis:names:tc:entity:xmlns:xml:catalog"&gt;<br>
+<br>
+&lt;!-- ..................................................................=
.... --&gt;<br>
+&lt;!-- XML Catalog data for DocBook XML V4.2 ............................=
.... --&gt;<br>
+&lt;!-- File catalog.xml .................................................=
.... --&gt;<br>
+<br>
+&lt;!-- Please direct all questions, bug reports, or suggestions for<br>
+&nbsp; &nbsp; &nbsp;changes to the <a href=3D"mailto:docbook@lists.oasis-o=
pen.org" target=3D"_blank">docbook@lists.oasis-open.org</a> mailing list. F=
or more<br>
+&nbsp; &nbsp; &nbsp;information, see <a href=3D"http://www.oasis-open.org/=
" rel=3D"noreferrer" target=3D"_blank">http://www.oasis-open.org/</a>.<br>
+&nbsp; --&gt;<br>
+<br>
+&lt;!-- This is the catalog data file for DocBook V4.2. It is provided as<=
br>
+&nbsp; &nbsp; &nbsp;a convenience in building your own catalog files. You =
need not use<br>
+&nbsp; &nbsp; &nbsp;the filenames listed here, and need not use the filena=
me method of<br>
+&nbsp; &nbsp; &nbsp;identifying storage objects at all.&nbsp; See the docu=
mentation for<br>
+&nbsp; &nbsp; &nbsp;detailed information on the files associated with the =
DocBook DTD.<br>
+&nbsp; &nbsp; &nbsp;See XML Catalogs at <a href=3D"http://www.oasis-open.o=
rg/committees/entity/" rel=3D"noreferrer" target=3D"_blank">http://www.oasi=
s-open.org/committees/entity/</a> for<br>
+&nbsp; &nbsp; &nbsp;detailed information on supplying and using catalog da=
ta.<br>
+&nbsp; --&gt;<br>
+<br>
+&lt;!-- ..................................................................=
.... --&gt;<br>
+&lt;!-- DocBook driver file ..............................................=
.... --&gt;<br>
+<br>
+&lt;public publicId=3D"-//OASIS//DTD DocBook XML V4.2//EN"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"docbookx.dtd"/&gt;<br>
+<br>
+&lt;!-- ..................................................................=
.... --&gt;<br>
+&lt;!-- DocBook modules ..................................................=
.... --&gt;<br>
+<br>
+&lt;public publicId=3D"-//OASIS//DTD DocBook CALS Table Model V4.2//EN"<br=
>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"calstblx.dtd"/&gt;<br>
+<br>
+&lt;public publicId=3D"-//OASIS//DTD XML Exchange Table Model 19990315//EN=
"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"soextblx.dtd"/&gt;<br>
+<br>
+&lt;public publicId=3D"-//OASIS//ELEMENTS DocBook Information Pool V4.2//E=
N"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"dbpoolx.mod"/&gt;<br>
+<br>
+&lt;public publicId=3D"-//OASIS//ELEMENTS DocBook Document Hierarchy V4.2/=
/EN"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"dbhierx.mod"/&gt;<br>
+<br>
+&lt;public publicId=3D"-//OASIS//ENTITIES DocBook Additional General Entit=
ies V4.2//EN"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"dbgenent.mod"/&gt;<br>
+<br>
+&lt;public publicId=3D"-//OASIS//ENTITIES DocBook Notations V4.2//EN"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"dbnotnx.mod"/&gt;<br>
+<br>
+&lt;public publicId=3D"-//OASIS//ENTITIES DocBook Character Entities V4.2/=
/EN"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"dbcentx.mod"/&gt;<br>
+<br>
+&lt;!-- ..................................................................=
.... --&gt;<br>
+&lt;!-- ISO entity sets ..................................................=
.... --&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Diacritical Marks//EN//XML"=
<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-dia.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Numeric and Special Graphic=
//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-num.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Publishing//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-pub.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES General Technical//EN//XML"=
<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-tech.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Latin 1//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-lat1.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Latin 2//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-lat2.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Greek Letters//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-grk1.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Monotoniko Greek//EN//XML"<=
br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-grk2.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Greek Symbols//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-grk3.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Alternative Greek Symbols//=
EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-grk4.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Arrow R=
elations//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-amsa.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Binary =
Operators//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-amsb.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Delimit=
ers//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-amsc.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Negated=
 Relations//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-amsn.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Ordinar=
y//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-amso.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Relatio=
ns//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-amsr.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Box and Line Drawing//EN//X=
ML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-box.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Russian Cyrillic//EN//XML"<=
br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-cyr1.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Non-Russian Cyrillic//EN//X=
ML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-cyr2.ent"/&gt;<br>
+<br>
+&lt;!-- End of catalog data for DocBook XML V4.2 .........................=
.... --&gt;<br>
+&lt;!-- ..................................................................=
.... --&gt;<br>
+<br>
+&lt;/catalog&gt;<br>
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/ca=
talog-4.3.xml b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs=
/catalog-4.3.xml<br>
new file mode 100644<br>
index 0000000000..34d1afdd94<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-4=
.3.xml<br>
@@ -0,0 +1,115 @@<br>
+&lt;?xml version=3D'1.0'?&gt;<br>
+&lt;catalog xmlns=3D"urn:oasis:names:tc:entity:xmlns:xml:catalog"&gt;<br>
+<br>
+&lt;!-- ..................................................................=
.... --&gt;<br>
+&lt;!-- XML Catalog data for DocBook XML V4.3 ............................=
.... --&gt;<br>
+&lt;!-- File catalog.xml .................................................=
.... --&gt;<br>
+<br>
+&lt;!-- Please direct all questions, bug reports, or suggestions for<br>
+&nbsp; &nbsp; &nbsp;changes to the <a href=3D"mailto:docbook@lists.oasis-o=
pen.org" target=3D"_blank">docbook@lists.oasis-open.org</a> mailing list. F=
or more<br>
+&nbsp; &nbsp; &nbsp;information, see <a href=3D"http://www.oasis-open.org/=
" rel=3D"noreferrer" target=3D"_blank">http://www.oasis-open.org/</a>.<br>
+&nbsp; --&gt;<br>
+<br>
+&lt;!-- This is the catalog data file for DocBook V4.3. It is provided as<=
br>
+&nbsp; &nbsp; &nbsp;a convenience in building your own catalog files. You =
need not use<br>
+&nbsp; &nbsp; &nbsp;the filenames listed here, and need not use the filena=
me method of<br>
+&nbsp; &nbsp; &nbsp;identifying storage objects at all.&nbsp; See the docu=
mentation for<br>
+&nbsp; &nbsp; &nbsp;detailed information on the files associated with the =
DocBook DTD.<br>
+&nbsp; &nbsp; &nbsp;See XML Catalogs at <a href=3D"http://www.oasis-open.o=
rg/committees/entity/" rel=3D"noreferrer" target=3D"_blank">http://www.oasi=
s-open.org/committees/entity/</a> for<br>
+&nbsp; &nbsp; &nbsp;detailed information on supplying and using catalog da=
ta.<br>
+&nbsp; --&gt;<br>
+<br>
+&lt;!-- ..................................................................=
.... --&gt;<br>
+&lt;!-- DocBook driver file ..............................................=
.... --&gt;<br>
+<br>
+&lt;public publicId=3D"-//OASIS//DTD DocBook XML V4.3//EN"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"docbookx.dtd"/&gt;<br>
+<br>
+&lt;!-- ..................................................................=
.... --&gt;<br>
+&lt;!-- DocBook modules ..................................................=
.... --&gt;<br>
+<br>
+&lt;public publicId=3D"-//OASIS//DTD DocBook CALS Table Model V4.3//EN"<br=
>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"calstblx.dtd"/&gt;<br>
+<br>
+&lt;public publicId=3D"-//OASIS//DTD XML Exchange Table Model 19990315//EN=
"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"soextblx.dtd"/&gt;<br>
+<br>
+&lt;public publicId=3D"-//OASIS//ELEMENTS DocBook Information Pool V4.3//E=
N"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"dbpoolx.mod"/&gt;<br>
+<br>
+&lt;public publicId=3D"-//OASIS//ELEMENTS DocBook Document Hierarchy V4.3/=
/EN"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"dbhierx.mod"/&gt;<br>
+<br>
+&lt;public publicId=3D"-//OASIS//ENTITIES DocBook Additional General Entit=
ies V4.3//EN"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"dbgenent.mod"/&gt;<br>
+<br>
+&lt;public publicId=3D"-//OASIS//ENTITIES DocBook Notations V4.3//EN"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"dbnotnx.mod"/&gt;<br>
+<br>
+&lt;public publicId=3D"-//OASIS//ENTITIES DocBook Character Entities V4.3/=
/EN"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"dbcentx.mod"/&gt;<br>
+<br>
+&lt;!-- ..................................................................=
.... --&gt;<br>
+&lt;!-- ISO entity sets ..................................................=
.... --&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Diacritical Marks//EN//XML"=
<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-dia.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Numeric and Special Graphic=
//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-num.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Publishing//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-pub.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES General Technical//EN//XML"=
<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-tech.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Latin 1//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-lat1.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Latin 2//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-lat2.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Greek Letters//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-grk1.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Monotoniko Greek//EN//XML"<=
br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-grk2.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Greek Symbols//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-grk3.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Alternative Greek Symbols//=
EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-grk4.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Arrow R=
elations//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-amsa.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Binary =
Operators//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-amsb.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Delimit=
ers//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-amsc.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Negated=
 Relations//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-amsn.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Ordinar=
y//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-amso.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Relatio=
ns//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-amsr.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Box and Line Drawing//EN//X=
ML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-box.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Russian Cyrillic//EN//XML"<=
br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-cyr1.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Non-Russian Cyrillic//EN//X=
ML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-cyr2.ent"/&gt;<br>
+<br>
+&lt;!-- End of catalog data for DocBook XML V4.3 .........................=
.... --&gt;<br>
+&lt;!-- ..................................................................=
.... --&gt;<br>
+<br>
+&lt;/catalog&gt;<br>
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/ca=
talog-4.4.xml b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs=
/catalog-4.4.xml<br>
new file mode 100644<br>
index 0000000000..8d709ba102<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-4=
.4.xml<br>
@@ -0,0 +1,124 @@<br>
+&lt;?xml version=3D'1.0'?&gt;<br>
+&lt;catalog xmlns=3D"urn:oasis:names:tc:entity:xmlns:xml:catalog" prefer=
=3D"public"&gt;<br>
+<br>
+&lt;!-- ..................................................................=
.... --&gt;<br>
+&lt;!-- XML Catalog data for DocBook XML V4.4 ............................=
.... --&gt;<br>
+&lt;!-- File catalog.xml .................................................=
.... --&gt;<br>
+<br>
+&lt;!-- Please direct all questions, bug reports, or suggestions for<br>
+&nbsp; &nbsp; &nbsp;changes to the <a href=3D"mailto:docbook@lists.oasis-o=
pen.org" target=3D"_blank">docbook@lists.oasis-open.org</a> mailing list. F=
or more<br>
+&nbsp; &nbsp; &nbsp;information, see <a href=3D"http://www.oasis-open.org/=
" rel=3D"noreferrer" target=3D"_blank">http://www.oasis-open.org/</a>.<br>
+&nbsp; --&gt;<br>
+<br>
+&lt;!-- This is the catalog data file for DocBook V4.4. It is provided as<=
br>
+&nbsp; &nbsp; &nbsp;a convenience in building your own catalog files. You =
need not use<br>
+&nbsp; &nbsp; &nbsp;the filenames listed here, and need not use the filena=
me method of<br>
+&nbsp; &nbsp; &nbsp;identifying storage objects at all.&nbsp; See the docu=
mentation for<br>
+&nbsp; &nbsp; &nbsp;detailed information on the files associated with the =
DocBook DTD.<br>
+&nbsp; &nbsp; &nbsp;See XML Catalogs at <a href=3D"http://www.oasis-open.o=
rg/committees/entity/" rel=3D"noreferrer" target=3D"_blank">http://www.oasi=
s-open.org/committees/entity/</a> for<br>
+&nbsp; &nbsp; &nbsp;detailed information on supplying and using catalog da=
ta.<br>
+&nbsp; --&gt;<br>
+<br>
+&lt;!-- ..................................................................=
.... --&gt;<br>
+&lt;!-- DocBook driver file ..............................................=
.... --&gt;<br>
+<br>
+&lt;public publicId=3D"-//OASIS//DTD DocBook XML V4.4//EN"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"docbookx.dtd"/&gt;<br>
+<br>
+&lt;system systemId=3D"<a href=3D"http://www.oasis-open.org/docbook/xml/4.=
4/docbookx.dtd" rel=3D"noreferrer" target=3D"_blank">http://www.oasis-open.=
org/docbook/xml/4.4/docbookx.dtd</a>"<br>
+&nbsp; &nbsp; &nbsp; &nbsp;uri=3D"docbookx.dtd"/&gt;<br>
+<br>
+&lt;system systemId=3D"<a href=3D"http://docbook.org/xml/4.4/docbookx.dtd"=
 rel=3D"noreferrer" target=3D"_blank">http://docbook.org/xml/4.4/docbookx.d=
td</a>"<br>
+&nbsp; &nbsp; &nbsp; &nbsp;uri=3D"docbookx.dtd"/&gt;<br>
+<br>
+&lt;!-- ..................................................................=
.... --&gt;<br>
+&lt;!-- DocBook modules ..................................................=
.... --&gt;<br>
+<br>
+&lt;public publicId=3D"-//OASIS//DTD DocBook CALS Table Model V4.4//EN"<br=
>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"calstblx.dtd"/&gt;<br>
+<br>
+&lt;public publicId=3D"-//OASIS//ELEMENTS DocBook XML HTML Tables V4.4//EN=
"<br>
+&nbsp; &nbsp; &nbsp; &nbsp;uri=3D"htmltblx.mod"/&gt;<br>
+<br>
+&lt;public publicId=3D"-//OASIS//DTD XML Exchange Table Model 19990315//EN=
"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"soextblx.dtd"/&gt;<br>
+<br>
+&lt;public publicId=3D"-//OASIS//ELEMENTS DocBook Information Pool V4.4//E=
N"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"dbpoolx.mod"/&gt;<br>
+<br>
+&lt;public publicId=3D"-//OASIS//ELEMENTS DocBook Document Hierarchy V4.4/=
/EN"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"dbhierx.mod"/&gt;<br>
+<br>
+&lt;public publicId=3D"-//OASIS//ENTITIES DocBook Additional General Entit=
ies V4.4//EN"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"dbgenent.mod"/&gt;<br>
+<br>
+&lt;public publicId=3D"-//OASIS//ENTITIES DocBook Notations V4.4//EN"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"dbnotnx.mod"/&gt;<br>
+<br>
+&lt;public publicId=3D"-//OASIS//ENTITIES DocBook Character Entities V4.4/=
/EN"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"dbcentx.mod"/&gt;<br>
+<br>
+&lt;!-- ..................................................................=
.... --&gt;<br>
+&lt;!-- ISO entity sets ..................................................=
.... --&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Diacritical Marks//EN//XML"=
<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isodia.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Numeric and Special Graphic=
//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isonum.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Publishing//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isopub.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES General Technical//EN//XML"=
<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isotech.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Latin 1//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isolat1.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Latin 2//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isolat2.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Greek Letters//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isogrk1.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Monotoniko Greek//EN//XML"<=
br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isogrk2.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Greek Symbols//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isogrk3.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Alternative Greek Symbols//=
EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isogrk4.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Arrow R=
elations//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isoamsa.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Binary =
Operators//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isoamsb.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Delimit=
ers//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isoamsc.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Negated=
 Relations//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isoamsn.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Ordinar=
y//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isoamso.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Relatio=
ns//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isoamsr.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Box and Line Drawing//EN//X=
ML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isobox.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Russian Cyrillic//EN//XML"<=
br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isocyr1.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Non-Russian Cyrillic//EN//X=
ML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isocyr2.ent"/&gt;<br>
+<br>
+&lt;!-- End of catalog data for DocBook XML V4.4 .........................=
.... --&gt;<br>
+&lt;!-- ..................................................................=
.... --&gt;<br>
+<br>
+&lt;/catalog&gt;<br>
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/ca=
talog-4.5.xml b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs=
/catalog-4.5.xml<br>
new file mode 100644<br>
index 0000000000..f75c1d764d<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-4=
.5.xml<br>
@@ -0,0 +1,124 @@<br>
+&lt;?xml version=3D'1.0'?&gt;<br>
+&lt;catalog xmlns=3D"urn:oasis:names:tc:entity:xmlns:xml:catalog" prefer=
=3D"public"&gt;<br>
+<br>
+&lt;!-- ..................................................................=
.... --&gt;<br>
+&lt;!-- XML Catalog data for DocBook XML V4.5 ............................=
.... --&gt;<br>
+&lt;!-- File catalog.xml .................................................=
.... --&gt;<br>
+<br>
+&lt;!-- Please direct all questions, bug reports, or suggestions for<br>
+&nbsp; &nbsp; &nbsp;changes to the <a href=3D"mailto:docbook@lists.oasis-o=
pen.org" target=3D"_blank">docbook@lists.oasis-open.org</a> mailing list. F=
or more<br>
+&nbsp; &nbsp; &nbsp;information, see <a href=3D"http://www.oasis-open.org/=
" rel=3D"noreferrer" target=3D"_blank">http://www.oasis-open.org/</a>.<br>
+&nbsp; --&gt;<br>
+<br>
+&lt;!-- This is the catalog data file for DocBook V4.5. It is provided as<=
br>
+&nbsp; &nbsp; &nbsp;a convenience in building your own catalog files. You =
need not use<br>
+&nbsp; &nbsp; &nbsp;the filenames listed here, and need not use the filena=
me method of<br>
+&nbsp; &nbsp; &nbsp;identifying storage objects at all.&nbsp; See the docu=
mentation for<br>
+&nbsp; &nbsp; &nbsp;detailed information on the files associated with the =
DocBook DTD.<br>
+&nbsp; &nbsp; &nbsp;See XML Catalogs at <a href=3D"http://www.oasis-open.o=
rg/committees/entity/" rel=3D"noreferrer" target=3D"_blank">http://www.oasi=
s-open.org/committees/entity/</a> for<br>
+&nbsp; &nbsp; &nbsp;detailed information on supplying and using catalog da=
ta.<br>
+&nbsp; --&gt;<br>
+<br>
+&lt;!-- ..................................................................=
.... --&gt;<br>
+&lt;!-- DocBook driver file ..............................................=
.... --&gt;<br>
+<br>
+&lt;public publicId=3D"-//OASIS//DTD DocBook XML V4.5//EN"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"docbookx.dtd"/&gt;<br>
+<br>
+&lt;system systemId=3D"<a href=3D"http://www.oasis-open.org/docbook/xml/4.=
5/docbookx.dtd" rel=3D"noreferrer" target=3D"_blank">http://www.oasis-open.=
org/docbook/xml/4.5/docbookx.dtd</a>"<br>
+&nbsp; &nbsp; &nbsp; &nbsp;uri=3D"docbookx.dtd"/&gt;<br>
+<br>
+&lt;system systemId=3D"<a href=3D"http://docbook.org/xml/4.5/docbookx.dtd"=
 rel=3D"noreferrer" target=3D"_blank">http://docbook.org/xml/4.5/docbookx.d=
td</a>"<br>
+&nbsp; &nbsp; &nbsp; &nbsp;uri=3D"docbookx.dtd"/&gt;<br>
+<br>
+&lt;!-- ..................................................................=
.... --&gt;<br>
+&lt;!-- DocBook modules ..................................................=
.... --&gt;<br>
+<br>
+&lt;public publicId=3D"-//OASIS//DTD DocBook CALS Table Model V4.5//EN"<br=
>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"calstblx.dtd"/&gt;<br>
+<br>
+&lt;public publicId=3D"-//OASIS//ELEMENTS DocBook XML HTML Tables V4.5//EN=
"<br>
+&nbsp; &nbsp; &nbsp; &nbsp;uri=3D"htmltblx.mod"/&gt;<br>
+<br>
+&lt;public publicId=3D"-//OASIS//DTD XML Exchange Table Model 19990315//EN=
"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"soextblx.dtd"/&gt;<br>
+<br>
+&lt;public publicId=3D"-//OASIS//ELEMENTS DocBook Information Pool V4.5//E=
N"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"dbpoolx.mod"/&gt;<br>
+<br>
+&lt;public publicId=3D"-//OASIS//ELEMENTS DocBook Document Hierarchy V4.5/=
/EN"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"dbhierx.mod"/&gt;<br>
+<br>
+&lt;public publicId=3D"-//OASIS//ENTITIES DocBook Additional General Entit=
ies V4.5//EN"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"dbgenent.mod"/&gt;<br>
+<br>
+&lt;public publicId=3D"-//OASIS//ENTITIES DocBook Notations V4.5//EN"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"dbnotnx.mod"/&gt;<br>
+<br>
+&lt;public publicId=3D"-//OASIS//ENTITIES DocBook Character Entities V4.5/=
/EN"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"dbcentx.mod"/&gt;<br>
+<br>
+&lt;!-- ..................................................................=
.... --&gt;<br>
+&lt;!-- ISO entity sets ..................................................=
.... --&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Diacritical Marks//EN//XML"=
<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isodia.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Numeric and Special Graphic=
//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isonum.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Publishing//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isopub.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES General Technical//EN//XML"=
<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isotech.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Latin 1//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isolat1.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Latin 2//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isolat2.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Greek Letters//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isogrk1.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Monotoniko Greek//EN//XML"<=
br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isogrk2.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Greek Symbols//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isogrk3.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Alternative Greek Symbols//=
EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isogrk4.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Arrow R=
elations//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isoamsa.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Binary =
Operators//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isoamsb.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Delimit=
ers//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isoamsc.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Negated=
 Relations//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isoamsn.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Ordinar=
y//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isoamso.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Relatio=
ns//EN//XML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isoamsr.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Box and Line Drawing//EN//X=
ML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isobox.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Russian Cyrillic//EN//XML"<=
br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isocyr1.ent"/&gt;<br>
+<br>
+&lt;public publicId=3D"ISO 8879:1986//ENTITIES Non-Russian Cyrillic//EN//X=
ML"<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isocyr2.ent"/&gt;<br>
+<br>
+&lt;!-- End of catalog data for DocBook XML V4.5 .........................=
.... --&gt;<br>
+&lt;!-- ..................................................................=
.... --&gt;<br>
+<br>
+&lt;/catalog&gt;<br>
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xml=
-update-catalog.xml.patch b/meta/recipes-devtools/docbook-xml/docbook-xml-d=
td4/docbook-xml-update-catalog.xml.patch<br>
deleted file mode 100644<br>
index 59703609ca..0000000000<br>
--- a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xml-update=
-catalog.xml.patch<br>
+++ /dev/null<br>
@@ -1,515 +0,0 @@<br>
-docbook-xml: update catalog.xml<br>
-<br>
-Refer Ubuntu 13.04 to update catalog.xml<br>
-<br>
-Upstream-Status: Pending<br>
-Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" =
target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
----<br>
- docbook-4.0/catalog.xml&nbsp; &nbsp;| 72 ++++++++++++++++++++++++++++++++=
+++++++++++++++<br>
- docbook-4.1.2/catalog.xml | 66 ++++++++++++++++++++++++++++++++++++++++++=
+<br>
- docbook-4.2/catalog.xml&nbsp; &nbsp;| 69 ++++++--------------------------=
-------------<br>
- docbook-4.3/catalog.xml&nbsp; &nbsp;| 72 ++++++++------------------------=
---------------<br>
- docbook-4.4/catalog.xml&nbsp; &nbsp;| 63 ++------------------------------=
---------<br>
- docbook-4.5/catalog.xml&nbsp; &nbsp;| 63 ++------------------------------=
---------<br>
- 6 files changed, 165 insertions(+), 240 deletions(-)<br>
- create mode 100644 docbook-4.0/catalog.xml<br>
- create mode 100644 docbook-4.1.2/catalog.xml<br>
-<br>
-diff --git a/docbook-4.0/catalog.xml b/docbook-4.0/catalog.xml<br>
-new file mode 100644<br>
---- /dev/null<br>
-+++ b/docbook-4.0/catalog.xml<br>
-@@ -0,0 +1,72 @@<br>
-+&lt;?xml version=3D'1.0'?&gt;<br>
-+&lt;!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML Catalog =
V1.0//EN" <br>
-+&nbsp; &nbsp; "<a href=3D"http://www.oasis-open.org/committees/entity/rel=
ease/1.0/catalog.dtd" rel=3D"noreferrer" target=3D"_blank">http://www.oasis=
-open.org/committees/entity/release/1.0/catalog.dtd</a>"&gt;<br>
-+<br>
-+&lt;catalog xmlns=3D"urn:oasis:names:tc:entity:xmlns:xml:catalog"&gt;<br>
-+<br>
-+&lt;!-- .................................................................=
..... --&gt;<br>
-+&lt;!-- XML Catalog data for DocBook XML V4.0............................=
... --&gt;<br>
-+&lt;!-- File catalog.xml ................................................=
..... --&gt;<br>
-+<br>
-+&lt;!-- Please direct all questions, bug reports, or suggestions for<br>
-+&nbsp; &nbsp; &nbsp;changes to the <a href=3D"mailto:docbook@lists.oasis-=
open.org" target=3D"_blank">docbook@lists.oasis-open.org</a> mailing list. =
For more<br>
-+&nbsp; &nbsp; &nbsp;information, see <a href=3D"http://www.oasis-open.org=
/" rel=3D"noreferrer" target=3D"_blank">http://www.oasis-open.org/</a>.<br>
-+&nbsp; --&gt;<br>
-+<br>
-+&lt;!-- This is the catalog data file for DocBook V4.0. It is provided as=
<br>
-+&nbsp; &nbsp; &nbsp;a convenience in building your own catalog files. You=
 need not use<br>
-+&nbsp; &nbsp; &nbsp;the filenames listed here, and need not use the filen=
ame method of<br>
-+&nbsp; &nbsp; &nbsp;identifying storage objects at all.&nbsp; See the doc=
umentation for<br>
-+&nbsp; &nbsp; &nbsp;detailed information on the files associated with the=
 DocBook DTD.<br>
-+&nbsp; &nbsp; &nbsp;See XML Catalogs at <a href=3D"http://www.oasis-open.=
org/committees/entity/" rel=3D"noreferrer" target=3D"_blank">http://www.oas=
is-open.org/committees/entity/</a> for<br>
-+&nbsp; &nbsp; &nbsp;detailed information on supplying and using catalog d=
ata.<br>
-+&nbsp; --&gt;<br>
-+<br>
-+&lt;!-- .................................................................=
..... --&gt;<br>
-+&lt;!-- DocBook driver file .............................................=
..... --&gt;<br>
-+<br>
-+&lt;public publicId=3D"-//Norman Walsh//DTD DocBk XML V4.0//EN"<br>
-+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"docbookx.dtd"/&gt;<br>
-+<br>
-+&lt;!-- Other ways to refer to DocBook XML v4.0..........................=
..... --&gt;<br>
-+&lt;public publicId=3D"-//Norman Walsh//DTD DocBook XML V4.0//EN"<br>
-+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"docbookx.dtd"/&gt;<br>
-+<br>
-+&lt;system systemId=3D"<a href=3D"http://www.oasis-open.org/docbook/xml/4=
.0/docbookx.dtd" rel=3D"noreferrer" target=3D"_blank">http://www.oasis-open=
.org/docbook/xml/4.0/docbookx.dtd</a>"<br>
-+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"docbookx.dtd"/&gt;<br>
-+<br>
-+&lt;!-- .................................................................=
..... --&gt;<br>
-+&lt;!-- DocBook modules .................................................=
..... --&gt;<br>
-+<br>
-+&lt;public publicId=3D"-//Norman Walsh//ENTITIES DocBook XML Notations V4=
.0//EN"<br>
-+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"dbnotnx.mod"/&gt;<br>
-+<br>
-+&lt;public publicId=3D"-//Norman Walsh//ENTITIES DocBook XML Character En=
tities V4.0//EN"<br>
-+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"dbcentx.mod"/&gt;<br>
-+<br>
-+&lt;public publicId=3D"-//Norman Walsh//ELEMENTS DocBook XML Information =
Pool V4.0//EN"<br>
-+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"dbpoolx.mod"/&gt;<br>
-+<br>
-+&lt;public publicId=3D"-//Norman Walsh//ELEMENTS DocBook XML Document Hie=
rarchy V4.0//EN"<br>
-+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"dbhierx.mod"/&gt;<br>
-+<br>
-+&lt;public publicId=3D"-//Norman Walsh//ENTITIES DocBook XML Additional G=
eneral Entities V4.0//EN"<br>
-+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"dbgenent.mod"/&gt;<br>
-+<br>
-+&lt;public publicId=3D"-//Norman Walsh//DTD CALS Table Model XML V4.0//EN=
"<br>
-+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"calstblx.dtd"/&gt;<br>
-+<br>
-+&lt;!-- UNOFFICIAL conversion of the exchange table model to XML, based o=
n the OASIS Exchange --&gt;<br>
-+&lt;!--&nbsp; &nbsp; Table Model PUBLIC "-//SGML Open//DTD Exchange Table=
 Model 19960430//EN"&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;--&gt;<br>
-+&lt;public publicId=3D"-//Normal Walsh//Exchange Table Model 19960430 XML=
 V4.0//EN"<br>
-+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"soextblx.dtd"/&gt;<br>
-+<br>
-+&lt;!-- the following FPI is declared for the DTD inside the DTD, but we'=
ll --&gt;<br>
-+&lt;!-- use the version from the latest DocBook<br>
-+&lt;public publicId=3D"-//OASIS//DTD XML Exchange Table Model 19990315//E=
N"<br>
-+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"soextblx.dtd"/&gt; --&gt;<br>
-+<br>
-+&lt;!-- End of catalog data for DocBook XML V4.0 ........................=
..... --&gt;<br>
-+&lt;!-- .................................................................=
..... --&gt;<br>
-+<br>
-+&lt;/catalog&gt;<br>
-diff --git a/docbook-4.1.2/catalog.xml b/docbook-4.1.2/catalog.xml<br>
-new file mode 100644<br>
---- /dev/null<br>
-+++ b/docbook-4.1.2/catalog.xml<br>
-@@ -0,0 +1,66 @@<br>
-+&lt;?xml version=3D'1.0'?&gt;<br>
-+&lt;!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML Catalog =
V1.0//EN" <br>
-+&nbsp; &nbsp; "<a href=3D"http://www.oasis-open.org/committees/entity/rel=
ease/1.0/catalog.dtd" rel=3D"noreferrer" target=3D"_blank">http://www.oasis=
-open.org/committees/entity/release/1.0/catalog.dtd</a>"&gt;<br>
-+<br>
-+&lt;catalog xmlns=3D"urn:oasis:names:tc:entity:xmlns:xml:catalog"&gt;<br>
-+<br>
-+&lt;!-- .................................................................=
..... --&gt;<br>
-+&lt;!-- XML Catalog data for DocBook XML V4.1.2..........................=
..... --&gt;<br>
-+&lt;!-- File catalog.xml ................................................=
..... --&gt;<br>
-+<br>
-+&lt;!-- Please direct all questions, bug reports, or suggestions for<br>
-+&nbsp; &nbsp; &nbsp;changes to the <a href=3D"mailto:docbook@lists.oasis-=
open.org" target=3D"_blank">docbook@lists.oasis-open.org</a> mailing list. =
For more<br>
-+&nbsp; &nbsp; &nbsp;information, see <a href=3D"http://www.oasis-open.org=
/" rel=3D"noreferrer" target=3D"_blank">http://www.oasis-open.org/</a>.<br>
-+&nbsp; --&gt;<br>
-+<br>
-+&lt;!-- This is the catalog data file for DocBook V4.1.2. It is provided =
as<br>
-+&nbsp; &nbsp; &nbsp;a convenience in building your own catalog files. You=
 need not use<br>
-+&nbsp; &nbsp; &nbsp;the filenames listed here, and need not use the filen=
ame method of<br>
-+&nbsp; &nbsp; &nbsp;identifying storage objects at all.&nbsp; See the doc=
umentation for<br>
-+&nbsp; &nbsp; &nbsp;detailed information on the files associated with the=
 DocBook DTD.<br>
-+&nbsp; &nbsp; &nbsp;See XML Catalogs at <a href=3D"http://www.oasis-open.=
org/committees/entity/" rel=3D"noreferrer" target=3D"_blank">http://www.oas=
is-open.org/committees/entity/</a> for<br>
-+&nbsp; &nbsp; &nbsp;detailed information on supplying and using catalog d=
ata.<br>
-+&nbsp; --&gt;<br>
-+<br>
-+&lt;!-- .................................................................=
..... --&gt;<br>
-+&lt;!-- DocBook driver file .............................................=
..... --&gt;<br>
-+<br>
-+&lt;public publicId=3D"-//OASIS//DTD DocBook XML V4.1.2//EN"<br>
-+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"docbookx.dtd"/&gt;<br>
-+<br>
-+&lt;system systemId=3D"<a href=3D"http://www.oasis-open.org/docbook/xml/4=
.1.2/docbookx.dtd" rel=3D"noreferrer" target=3D"_blank">http://www.oasis-op=
en.org/docbook/xml/4.1.2/docbookx.dtd</a>"<br>
-+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"docbookx.dtd"/&gt;<br>
-+<br>
-+&lt;system systemId=3D"<a href=3D"http://docbook.org/xml/4.1.2/docbookx.d=
td" rel=3D"noreferrer" target=3D"_blank">http://docbook.org/xml/4.1.2/docbo=
okx.dtd</a>"<br>
-+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"docbookx.dtd"/&gt;<br>
-+<br>
-+&lt;!-- .................................................................=
..... --&gt;<br>
-+&lt;!-- DocBook modules .................................................=
..... --&gt;<br>
-+<br>
-+&lt;public publicId=3D"-//OASIS//DTD DocBook CALS Table Model V4.1.2//EN"=
<br>
-+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"calstblx.dtd"/&gt;<br>
-+<br>
-+&nbsp; &lt;!-- already included in docbook 4.2<br>
-+&lt;public publicId=3D"-//OASIS//DTD XML Exchange Table Model 19990315//E=
N"<br>
-+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"soextblx.dtd"/&gt; --&gt;<br>
-+<br>
-+&lt;public publicId=3D"-//OASIS//ELEMENTS DocBook XML Information Pool V4=
.1.2//EN"<br>
-+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"dbpoolx.mod"/&gt;<br>
-+<br>
-+&lt;public publicId=3D"-//OASIS//ELEMENTS DocBook Document Hierarchy V4.1=
.2//EN"<br>
-+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"dbhierx.mod"/&gt;<br>
-+<br>
-+&lt;public publicId=3D"-//OASIS//ENTITIES DocBook Additional General Enti=
ties V4.1.2//EN"<br>
-+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"dbgenent.mod"/&gt;<br>
-+<br>
-+&lt;public publicId=3D"-//OASIS//ENTITIES DocBook Notations V4.1.2//EN"<b=
r>
-+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"dbnotnx.mod"/&gt;<br>
-+<br>
-+&lt;public publicId=3D"-//OASIS//ENTITIES DocBook Character Entities V4.1=
.2//EN"<br>
-+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"dbcentx.mod"/&gt;<br>
-+<br>
-+<br>
-+&lt;!-- End of catalog data for DocBook XML V4.1.2 ......................=
....... --&gt;<br>
-+&lt;!-- .................................................................=
..... --&gt;<br>
-+<br>
-+&lt;/catalog&gt;<br>
-diff --git a/docbook-4.2/catalog.xml b/docbook-4.2/catalog.xml<br>
---- a/docbook-4.2/catalog.xml<br>
-+++ b/docbook-4.2/catalog.xml<br>
-@@ -1,4 +1,7 @@<br>
- &lt;?xml version=3D'1.0'?&gt;<br>
-+&lt;!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML Catalog =
V1.0//EN"<br>
-+&nbsp; &nbsp; "<a href=3D"http://www.oasis-open.org/committees/entity/rel=
ease/1.0/catalog.dtd" rel=3D"noreferrer" target=3D"_blank">http://www.oasis=
-open.org/committees/entity/release/1.0/catalog.dtd</a>"&gt;<br>
-+<br>
- &lt;catalog xmlns=3D"urn:oasis:names:tc:entity:xmlns:xml:catalog"&gt;<br>
- <br>
- &lt;!-- .................................................................=
..... --&gt;<br>
-@@ -25,6 +28,12 @@<br>
- &lt;public publicId=3D"-//OASIS//DTD DocBook XML V4.2//EN"<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uri=3D"docbookx.dtd"/&gt;<br>
- <br>
-+&lt;system systemId=3D"<a href=3D"http://www.oasis-open.org/docbook/xml/4=
.2/docbookx.dtd" rel=3D"noreferrer" target=3D"_blank">http://www.oasis-open=
.org/docbook/xml/4.2/docbookx.dtd</a>"<br>
-+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"docbookx.dtd"/&gt;<br>
-+<br>
-+&lt;system systemId=3D"<a href=3D"http://docbook.org/xml/4.2/docbookx.dtd=
" rel=3D"noreferrer" target=3D"_blank">http://docbook.org/xml/4.2/docbookx.=
dtd</a>"<br>
-+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"docbookx.dtd"/&gt;<br>
-+<br>
- &lt;!-- .................................................................=
..... --&gt;<br>
- &lt;!-- DocBook modules .................................................=
..... --&gt;<br>
- <br>
-@@ -49,66 +58,6 @@<br>
- &lt;public publicId=3D"-//OASIS//ENTITIES DocBook Character Entities V4.2=
//EN"<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uri=3D"dbcentx.mod"/&gt;<br>
- <br>
--&lt;!-- .................................................................=
..... --&gt;<br>
--&lt;!-- ISO entity sets .................................................=
..... --&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Diacritical Marks//EN//XML=
"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-dia.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Numeric and Special Graphi=
c//EN//XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-num.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Publishing//EN//XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-pub.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES General Technical//EN//XML=
"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-tech.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Latin 1//EN//XML"<br=
>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-lat1.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Latin 2//EN//XML"<br=
>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-lat2.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Greek Letters//EN//XML"<br=
>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-grk1.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Monotoniko Greek//EN//XML"=
<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-grk2.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Greek Symbols//EN//XML"<br=
>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-grk3.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Alternative Greek Symbols/=
/EN//XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-grk4.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Arrow =
Relations//EN//XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-amsa.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Binary=
 Operators//EN//XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-amsb.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Delimi=
ters//EN//XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-amsc.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Negate=
d Relations//EN//XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-amsn.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Ordina=
ry//EN//XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-amso.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Relati=
ons//EN//XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-amsr.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Box and Line Drawing//EN//=
XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-box.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Russian Cyrillic//EN//XML"=
<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-cyr1.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Non-Russian Cyrillic//EN//=
XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-cyr2.ent"/&gt;<br>
--<br>
- &lt;!-- End of catalog data for DocBook XML V4.2 ........................=
..... --&gt;<br>
- &lt;!-- .................................................................=
..... --&gt;<br>
- <br>
-diff --git a/docbook-4.3/catalog.xml b/docbook-4.3/catalog.xml<br>
---- a/docbook-4.3/catalog.xml<br>
-+++ b/docbook-4.3/catalog.xml<br>
-@@ -1,4 +1,7 @@<br>
- &lt;?xml version=3D'1.0'?&gt;<br>
-+&lt;!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML Catalog =
V1.0//EN"<br>
-+&nbsp; &nbsp; "<a href=3D"http://www.oasis-open.org/committees/entity/rel=
ease/1.0/catalog.dtd" rel=3D"noreferrer" target=3D"_blank">http://www.oasis=
-open.org/committees/entity/release/1.0/catalog.dtd</a>"&gt;<br>
-+<br>
- &lt;catalog xmlns=3D"urn:oasis:names:tc:entity:xmlns:xml:catalog"&gt;<br>
- <br>
- &lt;!-- .................................................................=
..... --&gt;<br>
-@@ -25,12 +28,21 @@<br>
- &lt;public publicId=3D"-//OASIS//DTD DocBook XML V4.3//EN"<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uri=3D"docbookx.dtd"/&gt;<br>
- <br>
-+&lt;system systemId=3D"<a href=3D"http://www.oasis-open.org/docbook/xml/4=
.3/docbookx.dtd" rel=3D"noreferrer" target=3D"_blank">http://www.oasis-open=
.org/docbook/xml/4.3/docbookx.dtd</a>"<br>
-+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"docbookx.dtd"/&gt;<br>
-+<br>
-+&lt;system systemId=3D"<a href=3D"http://docbook.org/xml/4.3/docbookx.dtd=
" rel=3D"noreferrer" target=3D"_blank">http://docbook.org/xml/4.3/docbookx.=
dtd</a>"<br>
-+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"docbookx.dtd"/&gt;<br>
-+<br>
- &lt;!-- .................................................................=
..... --&gt;<br>
- &lt;!-- DocBook modules .................................................=
..... --&gt;<br>
- <br>
- &lt;public publicId=3D"-//OASIS//DTD DocBook CALS Table Model V4.3//EN"<b=
r>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uri=3D"calstblx.dtd"/&gt;<br>
- <br>
-+&lt;public publicId=3D"-//OASIS//ELEMENTS DocBook XML HTML Tables V4.3//E=
N"<br>
-+&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"htmltblx.mod"/&gt;<br>
-+<br>
- &lt;public publicId=3D"-//OASIS//DTD XML Exchange Table Model 19990315//E=
N"<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uri=3D"soextblx.dtd"/&gt;<br>
- <br>
-@@ -49,66 +61,6 @@<br>
- &lt;public publicId=3D"-//OASIS//ENTITIES DocBook Character Entities V4.3=
//EN"<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uri=3D"dbcentx.mod"/&gt;<br>
- <br>
--&lt;!-- .................................................................=
..... --&gt;<br>
--&lt;!-- ISO entity sets .................................................=
..... --&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Diacritical Marks//EN//XML=
"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-dia.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Numeric and Special Graphi=
c//EN//XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-num.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Publishing//EN//XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-pub.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES General Technical//EN//XML=
"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-tech.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Latin 1//EN//XML"<br=
>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-lat1.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Latin 2//EN//XML"<br=
>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-lat2.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Greek Letters//EN//XML"<br=
>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-grk1.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Monotoniko Greek//EN//XML"=
<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-grk2.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Greek Symbols//EN//XML"<br=
>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-grk3.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Alternative Greek Symbols/=
/EN//XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-grk4.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Arrow =
Relations//EN//XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-amsa.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Binary=
 Operators//EN//XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-amsb.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Delimi=
ters//EN//XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-amsc.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Negate=
d Relations//EN//XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-amsn.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Ordina=
ry//EN//XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-amso.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Relati=
ons//EN//XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-amsr.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Box and Line Drawing//EN//=
XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-box.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Russian Cyrillic//EN//XML"=
<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-cyr1.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Non-Russian Cyrillic//EN//=
XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/iso-cyr2.ent"/&gt;<br>
--<br>
- &lt;!-- End of catalog data for DocBook XML V4.3 ........................=
..... --&gt;<br>
- &lt;!-- .................................................................=
..... --&gt;<br>
- <br>
-diff --git a/docbook-4.4/catalog.xml b/docbook-4.4/catalog.xml<br>
---- a/docbook-4.4/catalog.xml<br>
-+++ b/docbook-4.4/catalog.xml<br>
-@@ -1,4 +1,7 @@<br>
- &lt;?xml version=3D'1.0'?&gt;<br>
-+&lt;!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML Catalog =
V1.0//EN"<br>
-+&nbsp; &nbsp; "<a href=3D"http://www.oasis-open.org/committees/entity/rel=
ease/1.0/catalog.dtd" rel=3D"noreferrer" target=3D"_blank">http://www.oasis=
-open.org/committees/entity/release/1.0/catalog.dtd</a>"&gt;<br>
-+<br>
- &lt;catalog xmlns=3D"urn:oasis:names:tc:entity:xmlns:xml:catalog" prefer=
=3D"public"&gt;<br>
- <br>
- &lt;!-- .................................................................=
..... --&gt;<br>
-@@ -58,66 +61,6 @@<br>
- &lt;public publicId=3D"-//OASIS//ENTITIES DocBook Character Entities V4.4=
//EN"<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uri=3D"dbcentx.mod"/&gt;<br>
- <br>
--&lt;!-- .................................................................=
..... --&gt;<br>
--&lt;!-- ISO entity sets .................................................=
..... --&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Diacritical Marks//EN//XML=
"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isodia.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Numeric and Special Graphi=
c//EN//XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isonum.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Publishing//EN//XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isopub.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES General Technical//EN//XML=
"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isotech.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Latin 1//EN//XML"<br=
>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isolat1.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Latin 2//EN//XML"<br=
>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isolat2.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Greek Letters//EN//XML"<br=
>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isogrk1.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Monotoniko Greek//EN//XML"=
<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isogrk2.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Greek Symbols//EN//XML"<br=
>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isogrk3.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Alternative Greek Symbols/=
/EN//XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isogrk4.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Arrow =
Relations//EN//XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isoamsa.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Binary=
 Operators//EN//XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isoamsb.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Delimi=
ters//EN//XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isoamsc.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Negate=
d Relations//EN//XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isoamsn.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Ordina=
ry//EN//XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isoamso.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Relati=
ons//EN//XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isoamsr.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Box and Line Drawing//EN//=
XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isobox.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Russian Cyrillic//EN//XML"=
<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isocyr1.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Non-Russian Cyrillic//EN//=
XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isocyr2.ent"/&gt;<br>
--<br>
- &lt;!-- End of catalog data for DocBook XML V4.4 ........................=
..... --&gt;<br>
- &lt;!-- .................................................................=
..... --&gt;<br>
- <br>
-diff --git a/docbook-4.5/catalog.xml b/docbook-4.5/catalog.xml<br>
---- a/docbook-4.5/catalog.xml<br>
-+++ b/docbook-4.5/catalog.xml<br>
-@@ -1,4 +1,7 @@<br>
- &lt;?xml version=3D'1.0'?&gt;<br>
-+&lt;!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML Catalog =
V1.0//EN"<br>
-+&nbsp; &nbsp; "<a href=3D"http://www.oasis-open.org/committees/entity/rel=
ease/1.0/catalog.dtd" rel=3D"noreferrer" target=3D"_blank">http://www.oasis=
-open.org/committees/entity/release/1.0/catalog.dtd</a>"&gt;<br>
-+<br>
- &lt;catalog xmlns=3D"urn:oasis:names:tc:entity:xmlns:xml:catalog" prefer=
=3D"public"&gt;<br>
- <br>
- &lt;!-- .................................................................=
..... --&gt;<br>
-@@ -58,66 +61,6 @@<br>
- &lt;public publicId=3D"-//OASIS//ENTITIES DocBook Character Entities V4.5=
//EN"<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uri=3D"dbcentx.mod"/&gt;<br>
- <br>
--&lt;!-- .................................................................=
..... --&gt;<br>
--&lt;!-- ISO entity sets .................................................=
..... --&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Diacritical Marks//EN//XML=
"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isodia.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Numeric and Special Graphi=
c//EN//XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isonum.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Publishing//EN//XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isopub.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES General Technical//EN//XML=
"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isotech.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Latin 1//EN//XML"<br=
>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isolat1.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Latin 2//EN//XML"<br=
>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isolat2.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Greek Letters//EN//XML"<br=
>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isogrk1.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Monotoniko Greek//EN//XML"=
<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isogrk2.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Greek Symbols//EN//XML"<br=
>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isogrk3.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Alternative Greek Symbols/=
/EN//XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isogrk4.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Arrow =
Relations//EN//XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isoamsa.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Binary=
 Operators//EN//XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isoamsb.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Delimi=
ters//EN//XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isoamsc.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Negate=
d Relations//EN//XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isoamsn.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Ordina=
ry//EN//XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isoamso.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Added Math Symbols: Relati=
ons//EN//XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isoamsr.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Box and Line Drawing//EN//=
XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isobox.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Russian Cyrillic//EN//XML"=
<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isocyr1.ent"/&gt;<br>
--<br>
--&lt;public publicId=3D"ISO 8879:1986//ENTITIES Non-Russian Cyrillic//EN//=
XML"<br>
--&nbsp; &nbsp; &nbsp; &nbsp; uri=3D"ent/isocyr2.ent"/&gt;<br>
--<br>
- &lt;!-- End of catalog data for DocBook XML V4.5 ........................=
..... --&gt;<br>
- &lt;!-- .................................................................=
..... --&gt;<br>
- <br>
--- <br>
-1.8.1.2<br>
-<br>
diff --git a/meta/recipes-devtools/docbook-xml/<a href=3D"http://docbook-xm=
l-dtd4_4.5.bb" rel=3D"noreferrer" target=3D"_blank">docbook-xml-dtd4_4.5.bb=
</a> b/meta/recipes-devtools/docbook-xml/<a href=3D"http://docbook-xml-dtd4=
_4.5.bb" rel=3D"noreferrer" target=3D"_blank">docbook-xml-dtd4_4.5.bb</a><b=
r>
index 6452c8d99f..786ca5418f 100644<br>
--- a/meta/recipes-devtools/docbook-xml/<a href=3D"http://docbook-xml-dtd4_=
4.5.bb" rel=3D"noreferrer" target=3D"_blank">docbook-xml-dtd4_4.5.bb</a><br=
>
+++ b/meta/recipes-devtools/docbook-xml/<a href=3D"http://docbook-xml-dtd4_=
4.5.bb" rel=3D"noreferrer" target=3D"_blank">docbook-xml-dtd4_4.5.bb</a><br=
>
@@ -1,9 +1,10 @@<br>
&nbsp;SUMMARY =3D "Document type definitions for verification of XML data f=
iles"<br>
&nbsp;DESCRIPTION =3D "Document type definitions for verification of XML da=
ta \<br>
-files against the DocBook rule set, it ships with the latest DocBook 4.5 \=
<br>
-XML DTD, as well as a selected set of legacy DTDs for use with older \<br>
-documents, including 4.0, 4.1.2, 4.2, 4.3 and 4.4"<br>
-HOMEPAGE =3D "<a href=3D"http://www.docbook.org/xml/" rel=3D"noreferrer" t=
arget=3D"_blank">http://www.docbook.org/xml/</a>"<br>
+files against the DocBook rule set. It ships with the latest DocBook 4.5 \=
<br>
+XML DTD, together with older version 4.2, 4.3 and 4.4."<br>
+HOMEPAGE =3D "<a href=3D"https://www.docbook.org/xml/" rel=3D"noreferrer" =
target=3D"_blank">https://www.docbook.org/xml/</a>"<br>
+<br>
+PR =3D "r1"<br>
<br>
&nbsp;LICENSE =3D "OASIS"<br>
&nbsp;LIC_FILES_CHKSUM =3D "file://${WORKDIR}/LICENSE-OASIS;md5=3Dc608985dd=
5f7f215e669e7639a0b1d2e"<br>
@@ -11,42 +12,37 @@ LIC_FILES_CHKSUM =3D "file://${WORKDIR}/LICENSE-OASIS;m=
d5=3Dc608985dd5f7f215e669e763<br>
&nbsp;# Note: the upstream sources are not distributed with a license file.=
<br>
&nbsp;# LICENSE-OASIS is included as a "patch" to workaround this. When<br>
&nbsp;# upgrading this recipe, please verify whether this is still needed.<=
br>
-SRC_URI =3D "<a href=3D"http://snapshot.debian.org/archive/debian/20160728=
T043443Z/pool/main/d/docbook-xml/docbook-xml_$%7BPV%7D.orig.tar.gz" rel=3D"=
noreferrer" target=3D"_blank">http://snapshot.debian.org/archive/debian/201=
60728T043443Z/pool/main/d/docbook-xml/docbook-xml_${PV}.orig.tar.gz</a> \<b=
r>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;file://LICENSE-OASIS \<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;file://docbook-xml-update-catalog=
.xml.patch \<br>
+SRC_URI =3D "\<br>
+&nbsp; &nbsp; file://LICENSE-OASIS \<br>
+&nbsp; &nbsp; file://catalogs/* \<br>
&nbsp;"<br>
<br>
-SRC_URI[md5sum] =3D "487b4d44e15cffb1f4048af23f98208e"<br>
-SRC_URI[sha256sum] =3D "b0f8edcf697f5318e63dd98c9a931f3fee167af0805ba441db=
372e0f17b2a44f"<br>
-<br>
-UPSTREAM_CHECK_URI =3D "${DEBIAN_MIRROR}/main/d/docbook-xml/"<br>
-<br>
-S =3D "${WORKDIR}/docbook-xml-4.5.c31424"<br>
-<br>
-inherit allarch<br>
+inherit allarch xmlcatalog<br>
&nbsp;BBCLASSEXTEND =3D "native"<br>
<br>
-do_configure (){<br>
-&nbsp; &nbsp; :<br>
-}<br>
+# the XMLCATALOGS variable is used in xmlcatalog BB class<br>
+XMLCATALOGS =3D "${sysconfdir}/xml/docbook-xml.xml"<br>
<br>
-do_compile (){<br>
-&nbsp; &nbsp; :<br>
-}<br>
+S =3D "${WORKDIR}"<br>
+<br>
+do_configure[noexec] =3D "1"<br>
+do_compile[noexec] =3D "1"<br>
<br>
&nbsp;do_install () {<br>
+<br>
&nbsp; &nbsp; &nbsp;install -d ${D}${sysconfdir}/xml/<br>
&nbsp; &nbsp; &nbsp;xmlcatalog --create --noout ${D}${sysconfdir}/xml/docbo=
ok-xml.xml<br>
<br>
-&nbsp; &nbsp; for DTDVERSION in 4.0 4.1.2 4.2 4.3 4.4 4.5; do<br>
-&nbsp; &nbsp; &nbsp; &nbsp; DEST=3D${datadir}/xml/docbook/schema/dtd/$DTDV=
ERSION<br>
+&nbsp; &nbsp; for catalog in $(ls catalogs); do<br>
+&nbsp; &nbsp; &nbsp; &nbsp; dtdVersion=3D$(echo ${catalog} | sed -rn 's/^c=
atalog-([0-9].[0-9])\.xml/\1/p')<br>
+&nbsp; &nbsp; &nbsp; &nbsp; DEST=3D${datadir}/xml/docbook/schema/dtd/${dtd=
Version}<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -d -m 755 ${D}$DEST<br>
-&nbsp; &nbsp; &nbsp; &nbsp; cp -v -R docbook-$DTDVERSION/* ${D}$DEST<br>
+&nbsp; &nbsp; &nbsp; &nbsp; cp -v -R catalogs/catalog-${dtdVersion}.xml ${=
D}$DEST/catalog.xml<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;xmlcatalog --verbose --noout --add nextCa=
talog unused file://$DEST/catalog.xml ${D}${sysconfdir}/xml/docbook-xml.xml=
<br>
&nbsp; &nbsp; &nbsp;done<br>
&nbsp;}<br>
<br>
-XMLCATALOGS =3D "${sysconfdir}/xml/docbook-xml.xml"<br>
-inherit xmlcatalog<br>
-<br>
-FILES_${PN} =3D "${datadir}/* ${sysconfdir}/xml/docbook-xml.xml"<br>
+FILES_${PN} =3D "\<br>
+&nbsp; &nbsp; ${datadir}/* \<br>
+&nbsp; &nbsp; ${XMLCATALOGS} \<br>
+"<br>
</blockquote></div></blockquote></body></html>

--=-pgRf8N/wtfiSNz83VVLW--
