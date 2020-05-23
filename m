Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com [209.85.217.68])
 by mx.groups.io with SMTP id smtpd.web12.2266.1590259855148762254
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 May 2020 11:50:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ih+KTfB4;
 spf=pass (domain: gmail.com, ip: 209.85.217.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f68.google.com with SMTP id l15so7962984vsr.3
        for <openembedded-core@lists.openembedded.org>; Sat, 23 May 2020 11:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ekw0uTGzK5pF6CVRZIJzKMofvN8V3oKT4mIXp0VdOQ4=;
        b=ih+KTfB4Ri5WATB39ZF29NX4iD01DHUvrAK+WgirrpGoJroCns8TyBQQilBB308mrm
         Hp7DD4seK8/sNF6z4iDeF6hdt/Sk/3ZsNfLa/ThGpOC0JYC806l6OAQ1FoyHXARUm/Df
         rvXvcSY8viF/G7sOH+YS5NMwZ+yze/kV7MKA7h85mewCKBEBksFQZB2DrwUTnTT849vy
         HGYTwsO06sAeKbdFRe6I8EKQ93MRtopD5dy2QJb6QRKweKcIavY0e8S3oHC9fAo9uqA3
         U7UkCXRiRGAeG+5OQwHc2p1uMWAkrAItRJa7Ba84rTwrEccV4KLsVCDToysXkueP/W7+
         00Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ekw0uTGzK5pF6CVRZIJzKMofvN8V3oKT4mIXp0VdOQ4=;
        b=ZQAFG7po1gunIs0+8x9OSs2DoBEcSXTNXGnpUEO+6pzP7gyvKnXDM2B21QVrdufnEt
         4TcxsKy69L/8xowM7N7OknOxtNHLKJqWZt5QP0GxlVWveXqpFqaFA0cU1Pmi4nklalCT
         c6X8cNIpNydhmisYDxskxr8SgW9+J5F4TPdyDiW10lxlNBYFdK40vvk5pfdhkmsSXuQw
         PjVSXC7kDNwkrlmRNK1aNZ1GfuA+4N9oSb6ubrvCt8GrGqNWixDZ5vj3Soq6rnqkbQDY
         TFKL9hmKRlkaLzmjZURnib/TxHc9Og2d7+g3QZy5aeK9l48QcJ27NnpcltjV2A8FeZ3w
         QfRw==
X-Gm-Message-State: AOAM530+PLzQgm+O5BIUK6oMYlo7Tj1gz8qJJz+KehWU89jK5pQDskYy
	AzzmgTiOZPr1/ooG6ZJod6vCR7YT5DVZBYTd7nQ=
X-Google-Smtp-Source: ABdhPJy9S6oUQl2n7VJN4hL8Btrc2Myh21cfMbzjaf6yzWu9xVJwSU06pNaiG8NUWCtk3SxDV2N9sbyJrYUYgtJG9SA=
X-Received: by 2002:a67:df86:: with SMTP id x6mr14234841vsk.94.1590259853659;
 Sat, 23 May 2020 11:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200523172049.1156001-1-gzatko@gmail.com>
In-Reply-To: <20200523172049.1156001-1-gzatko@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 23 May 2020 20:50:42 +0200
Message-ID: <CANNYZj-Fv7z_JYFgLhgj1vXpTGeJ_0Sk0MvyiOKDqsftBeBWMQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] docbook-xml: update recipe to stick with the upstream
To: Gregor Zatko <gzatko@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Gregor Zatko <gzatko@zoznam.sk>
Content-Type: multipart/alternative; boundary="000000000000ad92c405a655396b"

--000000000000ad92c405a655396b
Content-Type: text/plain; charset="UTF-8"

Can the original source be fetched though? Copying things over into the
layer itself is not the best option.

Alex

On Sat, 23 May 2020 at 19:20, Gregor Zatko <gzatko@gmail.com> wrote:

> From: Gregor Zatko <gzatko@zoznam.sk>
>
> Until now a Debian package has been used as a source.
> This change just switches it to project's upstream.
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13270
>
> Signed-off-by: Gregor Zatko <gzatko@gmail.com>
> ---
>  .../docbook-xml-dtd4/catalogs/catalog-4.2.xml | 115 ++++
>  .../docbook-xml-dtd4/catalogs/catalog-4.3.xml | 115 ++++
>  .../docbook-xml-dtd4/catalogs/catalog-4.4.xml | 124 +++++
>  .../docbook-xml-dtd4/catalogs/catalog-4.5.xml | 124 +++++
>  .../docbook-xml-update-catalog.xml.patch      | 515 ------------------
>  .../docbook-xml/docbook-xml-dtd4_4.5.bb       |  52 +-
>  6 files changed, 502 insertions(+), 543 deletions(-)
>  create mode 100644
> meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-4.2.xml
>  create mode 100644
> meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-4.3.xml
>  create mode 100644
> meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-4.4.xml
>  create mode 100644
> meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-4.5.xml
>  delete mode 100644
> meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xml-update-catalog.xml.patch
>
> diff --git
> a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-4.2.xml
> b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-4.2.xml
> new file mode 100644
> index 0000000000..6920c2f7e0
> --- /dev/null
> +++
> b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-4.2.xml
> @@ -0,0 +1,115 @@
> +<?xml version='1.0'?>
> +<catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
> +
> +<!--
> ...................................................................... -->
> +<!-- XML Catalog data for DocBook XML V4.2
> ................................ -->
> +<!-- File catalog.xml
> ..................................................... -->
> +
> +<!-- Please direct all questions, bug reports, or suggestions for
> +     changes to the docbook@lists.oasis-open.org mailing list. For more
> +     information, see http://www.oasis-open.org/.
> +  -->
> +
> +<!-- This is the catalog data file for DocBook V4.2. It is provided as
> +     a convenience in building your own catalog files. You need not use
> +     the filenames listed here, and need not use the filename method of
> +     identifying storage objects at all.  See the documentation for
> +     detailed information on the files associated with the DocBook DTD.
> +     See XML Catalogs at http://www.oasis-open.org/committees/entity/ for
> +     detailed information on supplying and using catalog data.
> +  -->
> +
> +<!--
> ...................................................................... -->
> +<!-- DocBook driver file
> .................................................. -->
> +
> +<public publicId="-//OASIS//DTD DocBook XML V4.2//EN"
> +        uri="docbookx.dtd"/>
> +
> +<!--
> ...................................................................... -->
> +<!-- DocBook modules
> ...................................................... -->
> +
> +<public publicId="-//OASIS//DTD DocBook CALS Table Model V4.2//EN"
> +        uri="calstblx.dtd"/>
> +
> +<public publicId="-//OASIS//DTD XML Exchange Table Model 19990315//EN"
> +        uri="soextblx.dtd"/>
> +
> +<public publicId="-//OASIS//ELEMENTS DocBook Information Pool V4.2//EN"
> +        uri="dbpoolx.mod"/>
> +
> +<public publicId="-//OASIS//ELEMENTS DocBook Document Hierarchy V4.2//EN"
> +        uri="dbhierx.mod"/>
> +
> +<public publicId="-//OASIS//ENTITIES DocBook Additional General Entities
> V4.2//EN"
> +        uri="dbgenent.mod"/>
> +
> +<public publicId="-//OASIS//ENTITIES DocBook Notations V4.2//EN"
> +        uri="dbnotnx.mod"/>
> +
> +<public publicId="-//OASIS//ENTITIES DocBook Character Entities V4.2//EN"
> +        uri="dbcentx.mod"/>
> +
> +<!--
> ...................................................................... -->
> +<!-- ISO entity sets
> ...................................................... -->
> +
> +<public publicId="ISO 8879:1986//ENTITIES Diacritical Marks//EN//XML"
> +        uri="ent/iso-dia.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Numeric and Special
> Graphic//EN//XML"
> +        uri="ent/iso-num.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Publishing//EN//XML"
> +        uri="ent/iso-pub.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES General Technical//EN//XML"
> +        uri="ent/iso-tech.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Added Latin 1//EN//XML"
> +        uri="ent/iso-lat1.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Added Latin 2//EN//XML"
> +        uri="ent/iso-lat2.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Greek Letters//EN//XML"
> +        uri="ent/iso-grk1.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Monotoniko Greek//EN//XML"
> +        uri="ent/iso-grk2.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Greek Symbols//EN//XML"
> +        uri="ent/iso-grk3.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Alternative Greek
> Symbols//EN//XML"
> +        uri="ent/iso-grk4.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Arrow
> Relations//EN//XML"
> +        uri="ent/iso-amsa.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Binary
> Operators//EN//XML"
> +        uri="ent/iso-amsb.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> Delimiters//EN//XML"
> +        uri="ent/iso-amsc.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Negated
> Relations//EN//XML"
> +        uri="ent/iso-amsn.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> Ordinary//EN//XML"
> +        uri="ent/iso-amso.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> Relations//EN//XML"
> +        uri="ent/iso-amsr.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Box and Line Drawing//EN//XML"
> +        uri="ent/iso-box.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Russian Cyrillic//EN//XML"
> +        uri="ent/iso-cyr1.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Non-Russian Cyrillic//EN//XML"
> +        uri="ent/iso-cyr2.ent"/>
> +
> +<!-- End of catalog data for DocBook XML V4.2
> ............................. -->
> +<!--
> ...................................................................... -->
> +
> +</catalog>
> diff --git
> a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-4.3.xml
> b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-4.3.xml
> new file mode 100644
> index 0000000000..34d1afdd94
> --- /dev/null
> +++
> b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-4.3.xml
> @@ -0,0 +1,115 @@
> +<?xml version='1.0'?>
> +<catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
> +
> +<!--
> ...................................................................... -->
> +<!-- XML Catalog data for DocBook XML V4.3
> ................................ -->
> +<!-- File catalog.xml
> ..................................................... -->
> +
> +<!-- Please direct all questions, bug reports, or suggestions for
> +     changes to the docbook@lists.oasis-open.org mailing list. For more
> +     information, see http://www.oasis-open.org/.
> +  -->
> +
> +<!-- This is the catalog data file for DocBook V4.3. It is provided as
> +     a convenience in building your own catalog files. You need not use
> +     the filenames listed here, and need not use the filename method of
> +     identifying storage objects at all.  See the documentation for
> +     detailed information on the files associated with the DocBook DTD.
> +     See XML Catalogs at http://www.oasis-open.org/committees/entity/ for
> +     detailed information on supplying and using catalog data.
> +  -->
> +
> +<!--
> ...................................................................... -->
> +<!-- DocBook driver file
> .................................................. -->
> +
> +<public publicId="-//OASIS//DTD DocBook XML V4.3//EN"
> +        uri="docbookx.dtd"/>
> +
> +<!--
> ...................................................................... -->
> +<!-- DocBook modules
> ...................................................... -->
> +
> +<public publicId="-//OASIS//DTD DocBook CALS Table Model V4.3//EN"
> +        uri="calstblx.dtd"/>
> +
> +<public publicId="-//OASIS//DTD XML Exchange Table Model 19990315//EN"
> +        uri="soextblx.dtd"/>
> +
> +<public publicId="-//OASIS//ELEMENTS DocBook Information Pool V4.3//EN"
> +        uri="dbpoolx.mod"/>
> +
> +<public publicId="-//OASIS//ELEMENTS DocBook Document Hierarchy V4.3//EN"
> +        uri="dbhierx.mod"/>
> +
> +<public publicId="-//OASIS//ENTITIES DocBook Additional General Entities
> V4.3//EN"
> +        uri="dbgenent.mod"/>
> +
> +<public publicId="-//OASIS//ENTITIES DocBook Notations V4.3//EN"
> +        uri="dbnotnx.mod"/>
> +
> +<public publicId="-//OASIS//ENTITIES DocBook Character Entities V4.3//EN"
> +        uri="dbcentx.mod"/>
> +
> +<!--
> ...................................................................... -->
> +<!-- ISO entity sets
> ...................................................... -->
> +
> +<public publicId="ISO 8879:1986//ENTITIES Diacritical Marks//EN//XML"
> +        uri="ent/iso-dia.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Numeric and Special
> Graphic//EN//XML"
> +        uri="ent/iso-num.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Publishing//EN//XML"
> +        uri="ent/iso-pub.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES General Technical//EN//XML"
> +        uri="ent/iso-tech.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Added Latin 1//EN//XML"
> +        uri="ent/iso-lat1.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Added Latin 2//EN//XML"
> +        uri="ent/iso-lat2.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Greek Letters//EN//XML"
> +        uri="ent/iso-grk1.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Monotoniko Greek//EN//XML"
> +        uri="ent/iso-grk2.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Greek Symbols//EN//XML"
> +        uri="ent/iso-grk3.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Alternative Greek
> Symbols//EN//XML"
> +        uri="ent/iso-grk4.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Arrow
> Relations//EN//XML"
> +        uri="ent/iso-amsa.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Binary
> Operators//EN//XML"
> +        uri="ent/iso-amsb.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> Delimiters//EN//XML"
> +        uri="ent/iso-amsc.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Negated
> Relations//EN//XML"
> +        uri="ent/iso-amsn.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> Ordinary//EN//XML"
> +        uri="ent/iso-amso.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> Relations//EN//XML"
> +        uri="ent/iso-amsr.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Box and Line Drawing//EN//XML"
> +        uri="ent/iso-box.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Russian Cyrillic//EN//XML"
> +        uri="ent/iso-cyr1.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Non-Russian Cyrillic//EN//XML"
> +        uri="ent/iso-cyr2.ent"/>
> +
> +<!-- End of catalog data for DocBook XML V4.3
> ............................. -->
> +<!--
> ...................................................................... -->
> +
> +</catalog>
> diff --git
> a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-4.4.xml
> b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-4.4.xml
> new file mode 100644
> index 0000000000..8d709ba102
> --- /dev/null
> +++
> b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-4.4.xml
> @@ -0,0 +1,124 @@
> +<?xml version='1.0'?>
> +<catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog"
> prefer="public">
> +
> +<!--
> ...................................................................... -->
> +<!-- XML Catalog data for DocBook XML V4.4
> ................................ -->
> +<!-- File catalog.xml
> ..................................................... -->
> +
> +<!-- Please direct all questions, bug reports, or suggestions for
> +     changes to the docbook@lists.oasis-open.org mailing list. For more
> +     information, see http://www.oasis-open.org/.
> +  -->
> +
> +<!-- This is the catalog data file for DocBook V4.4. It is provided as
> +     a convenience in building your own catalog files. You need not use
> +     the filenames listed here, and need not use the filename method of
> +     identifying storage objects at all.  See the documentation for
> +     detailed information on the files associated with the DocBook DTD.
> +     See XML Catalogs at http://www.oasis-open.org/committees/entity/ for
> +     detailed information on supplying and using catalog data.
> +  -->
> +
> +<!--
> ...................................................................... -->
> +<!-- DocBook driver file
> .................................................. -->
> +
> +<public publicId="-//OASIS//DTD DocBook XML V4.4//EN"
> +        uri="docbookx.dtd"/>
> +
> +<system systemId="http://www.oasis-open.org/docbook/xml/4.4/docbookx.dtd"
> +       uri="docbookx.dtd"/>
> +
> +<system systemId="http://docbook.org/xml/4.4/docbookx.dtd"
> +       uri="docbookx.dtd"/>
> +
> +<!--
> ...................................................................... -->
> +<!-- DocBook modules
> ...................................................... -->
> +
> +<public publicId="-//OASIS//DTD DocBook CALS Table Model V4.4//EN"
> +        uri="calstblx.dtd"/>
> +
> +<public publicId="-//OASIS//ELEMENTS DocBook XML HTML Tables V4.4//EN"
> +       uri="htmltblx.mod"/>
> +
> +<public publicId="-//OASIS//DTD XML Exchange Table Model 19990315//EN"
> +        uri="soextblx.dtd"/>
> +
> +<public publicId="-//OASIS//ELEMENTS DocBook Information Pool V4.4//EN"
> +        uri="dbpoolx.mod"/>
> +
> +<public publicId="-//OASIS//ELEMENTS DocBook Document Hierarchy V4.4//EN"
> +        uri="dbhierx.mod"/>
> +
> +<public publicId="-//OASIS//ENTITIES DocBook Additional General Entities
> V4.4//EN"
> +        uri="dbgenent.mod"/>
> +
> +<public publicId="-//OASIS//ENTITIES DocBook Notations V4.4//EN"
> +        uri="dbnotnx.mod"/>
> +
> +<public publicId="-//OASIS//ENTITIES DocBook Character Entities V4.4//EN"
> +        uri="dbcentx.mod"/>
> +
> +<!--
> ...................................................................... -->
> +<!-- ISO entity sets
> ...................................................... -->
> +
> +<public publicId="ISO 8879:1986//ENTITIES Diacritical Marks//EN//XML"
> +        uri="ent/isodia.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Numeric and Special
> Graphic//EN//XML"
> +        uri="ent/isonum.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Publishing//EN//XML"
> +        uri="ent/isopub.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES General Technical//EN//XML"
> +        uri="ent/isotech.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Added Latin 1//EN//XML"
> +        uri="ent/isolat1.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Added Latin 2//EN//XML"
> +        uri="ent/isolat2.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Greek Letters//EN//XML"
> +        uri="ent/isogrk1.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Monotoniko Greek//EN//XML"
> +        uri="ent/isogrk2.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Greek Symbols//EN//XML"
> +        uri="ent/isogrk3.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Alternative Greek
> Symbols//EN//XML"
> +        uri="ent/isogrk4.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Arrow
> Relations//EN//XML"
> +        uri="ent/isoamsa.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Binary
> Operators//EN//XML"
> +        uri="ent/isoamsb.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> Delimiters//EN//XML"
> +        uri="ent/isoamsc.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Negated
> Relations//EN//XML"
> +        uri="ent/isoamsn.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> Ordinary//EN//XML"
> +        uri="ent/isoamso.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> Relations//EN//XML"
> +        uri="ent/isoamsr.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Box and Line Drawing//EN//XML"
> +        uri="ent/isobox.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Russian Cyrillic//EN//XML"
> +        uri="ent/isocyr1.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Non-Russian Cyrillic//EN//XML"
> +        uri="ent/isocyr2.ent"/>
> +
> +<!-- End of catalog data for DocBook XML V4.4
> ............................. -->
> +<!--
> ...................................................................... -->
> +
> +</catalog>
> diff --git
> a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-4.5.xml
> b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-4.5.xml
> new file mode 100644
> index 0000000000..f75c1d764d
> --- /dev/null
> +++
> b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-4.5.xml
> @@ -0,0 +1,124 @@
> +<?xml version='1.0'?>
> +<catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog"
> prefer="public">
> +
> +<!--
> ...................................................................... -->
> +<!-- XML Catalog data for DocBook XML V4.5
> ................................ -->
> +<!-- File catalog.xml
> ..................................................... -->
> +
> +<!-- Please direct all questions, bug reports, or suggestions for
> +     changes to the docbook@lists.oasis-open.org mailing list. For more
> +     information, see http://www.oasis-open.org/.
> +  -->
> +
> +<!-- This is the catalog data file for DocBook V4.5. It is provided as
> +     a convenience in building your own catalog files. You need not use
> +     the filenames listed here, and need not use the filename method of
> +     identifying storage objects at all.  See the documentation for
> +     detailed information on the files associated with the DocBook DTD.
> +     See XML Catalogs at http://www.oasis-open.org/committees/entity/ for
> +     detailed information on supplying and using catalog data.
> +  -->
> +
> +<!--
> ...................................................................... -->
> +<!-- DocBook driver file
> .................................................. -->
> +
> +<public publicId="-//OASIS//DTD DocBook XML V4.5//EN"
> +        uri="docbookx.dtd"/>
> +
> +<system systemId="http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd"
> +       uri="docbookx.dtd"/>
> +
> +<system systemId="http://docbook.org/xml/4.5/docbookx.dtd"
> +       uri="docbookx.dtd"/>
> +
> +<!--
> ...................................................................... -->
> +<!-- DocBook modules
> ...................................................... -->
> +
> +<public publicId="-//OASIS//DTD DocBook CALS Table Model V4.5//EN"
> +        uri="calstblx.dtd"/>
> +
> +<public publicId="-//OASIS//ELEMENTS DocBook XML HTML Tables V4.5//EN"
> +       uri="htmltblx.mod"/>
> +
> +<public publicId="-//OASIS//DTD XML Exchange Table Model 19990315//EN"
> +        uri="soextblx.dtd"/>
> +
> +<public publicId="-//OASIS//ELEMENTS DocBook Information Pool V4.5//EN"
> +        uri="dbpoolx.mod"/>
> +
> +<public publicId="-//OASIS//ELEMENTS DocBook Document Hierarchy V4.5//EN"
> +        uri="dbhierx.mod"/>
> +
> +<public publicId="-//OASIS//ENTITIES DocBook Additional General Entities
> V4.5//EN"
> +        uri="dbgenent.mod"/>
> +
> +<public publicId="-//OASIS//ENTITIES DocBook Notations V4.5//EN"
> +        uri="dbnotnx.mod"/>
> +
> +<public publicId="-//OASIS//ENTITIES DocBook Character Entities V4.5//EN"
> +        uri="dbcentx.mod"/>
> +
> +<!--
> ...................................................................... -->
> +<!-- ISO entity sets
> ...................................................... -->
> +
> +<public publicId="ISO 8879:1986//ENTITIES Diacritical Marks//EN//XML"
> +        uri="ent/isodia.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Numeric and Special
> Graphic//EN//XML"
> +        uri="ent/isonum.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Publishing//EN//XML"
> +        uri="ent/isopub.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES General Technical//EN//XML"
> +        uri="ent/isotech.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Added Latin 1//EN//XML"
> +        uri="ent/isolat1.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Added Latin 2//EN//XML"
> +        uri="ent/isolat2.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Greek Letters//EN//XML"
> +        uri="ent/isogrk1.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Monotoniko Greek//EN//XML"
> +        uri="ent/isogrk2.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Greek Symbols//EN//XML"
> +        uri="ent/isogrk3.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Alternative Greek
> Symbols//EN//XML"
> +        uri="ent/isogrk4.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Arrow
> Relations//EN//XML"
> +        uri="ent/isoamsa.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Binary
> Operators//EN//XML"
> +        uri="ent/isoamsb.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> Delimiters//EN//XML"
> +        uri="ent/isoamsc.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Negated
> Relations//EN//XML"
> +        uri="ent/isoamsn.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> Ordinary//EN//XML"
> +        uri="ent/isoamso.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> Relations//EN//XML"
> +        uri="ent/isoamsr.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Box and Line Drawing//EN//XML"
> +        uri="ent/isobox.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Russian Cyrillic//EN//XML"
> +        uri="ent/isocyr1.ent"/>
> +
> +<public publicId="ISO 8879:1986//ENTITIES Non-Russian Cyrillic//EN//XML"
> +        uri="ent/isocyr2.ent"/>
> +
> +<!-- End of catalog data for DocBook XML V4.5
> ............................. -->
> +<!--
> ...................................................................... -->
> +
> +</catalog>
> diff --git
> a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xml-update-catalog.xml.patch
> b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xml-update-catalog.xml.patch
> deleted file mode 100644
> index 59703609ca..0000000000
> ---
> a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xml-update-catalog.xml.patch
> +++ /dev/null
> @@ -1,515 +0,0 @@
> -docbook-xml: update catalog.xml
> -
> -Refer Ubuntu 13.04 to update catalog.xml
> -
> -Upstream-Status: Pending
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ----
> - docbook-4.0/catalog.xml   | 72
> +++++++++++++++++++++++++++++++++++++++++++++++
> - docbook-4.1.2/catalog.xml | 66
> +++++++++++++++++++++++++++++++++++++++++++
> - docbook-4.2/catalog.xml   | 69
> ++++++---------------------------------------
> - docbook-4.3/catalog.xml   | 72
> ++++++++---------------------------------------
> - docbook-4.4/catalog.xml   | 63 ++---------------------------------------
> - docbook-4.5/catalog.xml   | 63 ++---------------------------------------
> - 6 files changed, 165 insertions(+), 240 deletions(-)
> - create mode 100644 docbook-4.0/catalog.xml
> - create mode 100644 docbook-4.1.2/catalog.xml
> -
> -diff --git a/docbook-4.0/catalog.xml b/docbook-4.0/catalog.xml
> -new file mode 100644
> ---- /dev/null
> -+++ b/docbook-4.0/catalog.xml
> -@@ -0,0 +1,72 @@
> -+<?xml version='1.0'?>
> -+<!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML Catalog
> V1.0//EN"
> -+    "http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd
> ">
> -+
> -+<catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
> -+
> -+<!--
> ...................................................................... -->
> -+<!-- XML Catalog data for DocBook XML
> V4.0............................... -->
> -+<!-- File catalog.xml
> ..................................................... -->
> -+
> -+<!-- Please direct all questions, bug reports, or suggestions for
> -+     changes to the docbook@lists.oasis-open.org mailing list. For more
> -+     information, see http://www.oasis-open.org/.
> -+  -->
> -+
> -+<!-- This is the catalog data file for DocBook V4.0. It is provided as
> -+     a convenience in building your own catalog files. You need not use
> -+     the filenames listed here, and need not use the filename method of
> -+     identifying storage objects at all.  See the documentation for
> -+     detailed information on the files associated with the DocBook DTD.
> -+     See XML Catalogs at http://www.oasis-open.org/committees/entity/
> for
> -+     detailed information on supplying and using catalog data.
> -+  -->
> -+
> -+<!--
> ...................................................................... -->
> -+<!-- DocBook driver file
> .................................................. -->
> -+
> -+<public publicId="-//Norman Walsh//DTD DocBk XML V4.0//EN"
> -+        uri="docbookx.dtd"/>
> -+
> -+<!-- Other ways to refer to DocBook XML
> v4.0............................... -->
> -+<public publicId="-//Norman Walsh//DTD DocBook XML V4.0//EN"
> -+        uri="docbookx.dtd"/>
> -+
> -+<system systemId="http://www.oasis-open.org/docbook/xml/4.0/docbookx.dtd
> "
> -+        uri="docbookx.dtd"/>
> -+
> -+<!--
> ...................................................................... -->
> -+<!-- DocBook modules
> ...................................................... -->
> -+
> -+<public publicId="-//Norman Walsh//ENTITIES DocBook XML Notations
> V4.0//EN"
> -+        uri="dbnotnx.mod"/>
> -+
> -+<public publicId="-//Norman Walsh//ENTITIES DocBook XML Character
> Entities V4.0//EN"
> -+        uri="dbcentx.mod"/>
> -+
> -+<public publicId="-//Norman Walsh//ELEMENTS DocBook XML Information Pool
> V4.0//EN"
> -+        uri="dbpoolx.mod"/>
> -+
> -+<public publicId="-//Norman Walsh//ELEMENTS DocBook XML Document
> Hierarchy V4.0//EN"
> -+        uri="dbhierx.mod"/>
> -+
> -+<public publicId="-//Norman Walsh//ENTITIES DocBook XML Additional
> General Entities V4.0//EN"
> -+        uri="dbgenent.mod"/>
> -+
> -+<public publicId="-//Norman Walsh//DTD CALS Table Model XML V4.0//EN"
> -+        uri="calstblx.dtd"/>
> -+
> -+<!-- UNOFFICIAL conversion of the exchange table model to XML, based on
> the OASIS Exchange -->
> -+<!--    Table Model PUBLIC "-//SGML Open//DTD Exchange Table Model
> 19960430//EN"           -->
> -+<public publicId="-//Normal Walsh//Exchange Table Model 19960430 XML
> V4.0//EN"
> -+        uri="soextblx.dtd"/>
> -+
> -+<!-- the following FPI is declared for the DTD inside the DTD, but we'll
> -->
> -+<!-- use the version from the latest DocBook
> -+<public publicId="-//OASIS//DTD XML Exchange Table Model 19990315//EN"
> -+        uri="soextblx.dtd"/> -->
> -+
> -+<!-- End of catalog data for DocBook XML V4.0
> ............................. -->
> -+<!--
> ...................................................................... -->
> -+
> -+</catalog>
> -diff --git a/docbook-4.1.2/catalog.xml b/docbook-4.1.2/catalog.xml
> -new file mode 100644
> ---- /dev/null
> -+++ b/docbook-4.1.2/catalog.xml
> -@@ -0,0 +1,66 @@
> -+<?xml version='1.0'?>
> -+<!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML Catalog
> V1.0//EN"
> -+    "http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd
> ">
> -+
> -+<catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
> -+
> -+<!--
> ...................................................................... -->
> -+<!-- XML Catalog data for DocBook XML
> V4.1.2............................... -->
> -+<!-- File catalog.xml
> ..................................................... -->
> -+
> -+<!-- Please direct all questions, bug reports, or suggestions for
> -+     changes to the docbook@lists.oasis-open.org mailing list. For more
> -+     information, see http://www.oasis-open.org/.
> -+  -->
> -+
> -+<!-- This is the catalog data file for DocBook V4.1.2. It is provided as
> -+     a convenience in building your own catalog files. You need not use
> -+     the filenames listed here, and need not use the filename method of
> -+     identifying storage objects at all.  See the documentation for
> -+     detailed information on the files associated with the DocBook DTD.
> -+     See XML Catalogs at http://www.oasis-open.org/committees/entity/
> for
> -+     detailed information on supplying and using catalog data.
> -+  -->
> -+
> -+<!--
> ...................................................................... -->
> -+<!-- DocBook driver file
> .................................................. -->
> -+
> -+<public publicId="-//OASIS//DTD DocBook XML V4.1.2//EN"
> -+        uri="docbookx.dtd"/>
> -+
> -+<system systemId="
> http://www.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd"
> -+        uri="docbookx.dtd"/>
> -+
> -+<system systemId="http://docbook.org/xml/4.1.2/docbookx.dtd"
> -+        uri="docbookx.dtd"/>
> -+
> -+<!--
> ...................................................................... -->
> -+<!-- DocBook modules
> ...................................................... -->
> -+
> -+<public publicId="-//OASIS//DTD DocBook CALS Table Model V4.1.2//EN"
> -+        uri="calstblx.dtd"/>
> -+
> -+  <!-- already included in docbook 4.2
> -+<public publicId="-//OASIS//DTD XML Exchange Table Model 19990315//EN"
> -+        uri="soextblx.dtd"/> -->
> -+
> -+<public publicId="-//OASIS//ELEMENTS DocBook XML Information Pool
> V4.1.2//EN"
> -+        uri="dbpoolx.mod"/>
> -+
> -+<public publicId="-//OASIS//ELEMENTS DocBook Document Hierarchy
> V4.1.2//EN"
> -+        uri="dbhierx.mod"/>
> -+
> -+<public publicId="-//OASIS//ENTITIES DocBook Additional General Entities
> V4.1.2//EN"
> -+        uri="dbgenent.mod"/>
> -+
> -+<public publicId="-//OASIS//ENTITIES DocBook Notations V4.1.2//EN"
> -+        uri="dbnotnx.mod"/>
> -+
> -+<public publicId="-//OASIS//ENTITIES DocBook Character Entities
> V4.1.2//EN"
> -+        uri="dbcentx.mod"/>
> -+
> -+
> -+<!-- End of catalog data for DocBook XML V4.1.2
> ............................. -->
> -+<!--
> ...................................................................... -->
> -+
> -+</catalog>
> -diff --git a/docbook-4.2/catalog.xml b/docbook-4.2/catalog.xml
> ---- a/docbook-4.2/catalog.xml
> -+++ b/docbook-4.2/catalog.xml
> -@@ -1,4 +1,7 @@
> - <?xml version='1.0'?>
> -+<!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML Catalog
> V1.0//EN"
> -+    "http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd
> ">
> -+
> - <catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
> -
> - <!--
> ...................................................................... -->
> -@@ -25,6 +28,12 @@
> - <public publicId="-//OASIS//DTD DocBook XML V4.2//EN"
> -         uri="docbookx.dtd"/>
> -
> -+<system systemId="http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd
> "
> -+        uri="docbookx.dtd"/>
> -+
> -+<system systemId="http://docbook.org/xml/4.2/docbookx.dtd"
> -+        uri="docbookx.dtd"/>
> -+
> - <!--
> ...................................................................... -->
> - <!-- DocBook modules
> ...................................................... -->
> -
> -@@ -49,66 +58,6 @@
> - <public publicId="-//OASIS//ENTITIES DocBook Character Entities V4.2//EN"
> -         uri="dbcentx.mod"/>
> -
> --<!--
> ...................................................................... -->
> --<!-- ISO entity sets
> ...................................................... -->
> --
> --<public publicId="ISO 8879:1986//ENTITIES Diacritical Marks//EN//XML"
> --        uri="ent/iso-dia.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Numeric and Special
> Graphic//EN//XML"
> --        uri="ent/iso-num.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Publishing//EN//XML"
> --        uri="ent/iso-pub.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES General Technical//EN//XML"
> --        uri="ent/iso-tech.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Added Latin 1//EN//XML"
> --        uri="ent/iso-lat1.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Added Latin 2//EN//XML"
> --        uri="ent/iso-lat2.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Greek Letters//EN//XML"
> --        uri="ent/iso-grk1.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Monotoniko Greek//EN//XML"
> --        uri="ent/iso-grk2.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Greek Symbols//EN//XML"
> --        uri="ent/iso-grk3.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Alternative Greek
> Symbols//EN//XML"
> --        uri="ent/iso-grk4.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Arrow
> Relations//EN//XML"
> --        uri="ent/iso-amsa.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Binary
> Operators//EN//XML"
> --        uri="ent/iso-amsb.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> Delimiters//EN//XML"
> --        uri="ent/iso-amsc.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Negated
> Relations//EN//XML"
> --        uri="ent/iso-amsn.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> Ordinary//EN//XML"
> --        uri="ent/iso-amso.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> Relations//EN//XML"
> --        uri="ent/iso-amsr.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Box and Line Drawing//EN//XML"
> --        uri="ent/iso-box.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Russian Cyrillic//EN//XML"
> --        uri="ent/iso-cyr1.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Non-Russian Cyrillic//EN//XML"
> --        uri="ent/iso-cyr2.ent"/>
> --
> - <!-- End of catalog data for DocBook XML V4.2
> ............................. -->
> - <!--
> ...................................................................... -->
> -
> -diff --git a/docbook-4.3/catalog.xml b/docbook-4.3/catalog.xml
> ---- a/docbook-4.3/catalog.xml
> -+++ b/docbook-4.3/catalog.xml
> -@@ -1,4 +1,7 @@
> - <?xml version='1.0'?>
> -+<!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML Catalog
> V1.0//EN"
> -+    "http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd
> ">
> -+
> - <catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
> -
> - <!--
> ...................................................................... -->
> -@@ -25,12 +28,21 @@
> - <public publicId="-//OASIS//DTD DocBook XML V4.3//EN"
> -         uri="docbookx.dtd"/>
> -
> -+<system systemId="http://www.oasis-open.org/docbook/xml/4.3/docbookx.dtd
> "
> -+        uri="docbookx.dtd"/>
> -+
> -+<system systemId="http://docbook.org/xml/4.3/docbookx.dtd"
> -+        uri="docbookx.dtd"/>
> -+
> - <!--
> ...................................................................... -->
> - <!-- DocBook modules
> ...................................................... -->
> -
> - <public publicId="-//OASIS//DTD DocBook CALS Table Model V4.3//EN"
> -         uri="calstblx.dtd"/>
> -
> -+<public publicId="-//OASIS//ELEMENTS DocBook XML HTML Tables V4.3//EN"
> -+        uri="htmltblx.mod"/>
> -+
> - <public publicId="-//OASIS//DTD XML Exchange Table Model 19990315//EN"
> -         uri="soextblx.dtd"/>
> -
> -@@ -49,66 +61,6 @@
> - <public publicId="-//OASIS//ENTITIES DocBook Character Entities V4.3//EN"
> -         uri="dbcentx.mod"/>
> -
> --<!--
> ...................................................................... -->
> --<!-- ISO entity sets
> ...................................................... -->
> --
> --<public publicId="ISO 8879:1986//ENTITIES Diacritical Marks//EN//XML"
> --        uri="ent/iso-dia.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Numeric and Special
> Graphic//EN//XML"
> --        uri="ent/iso-num.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Publishing//EN//XML"
> --        uri="ent/iso-pub.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES General Technical//EN//XML"
> --        uri="ent/iso-tech.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Added Latin 1//EN//XML"
> --        uri="ent/iso-lat1.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Added Latin 2//EN//XML"
> --        uri="ent/iso-lat2.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Greek Letters//EN//XML"
> --        uri="ent/iso-grk1.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Monotoniko Greek//EN//XML"
> --        uri="ent/iso-grk2.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Greek Symbols//EN//XML"
> --        uri="ent/iso-grk3.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Alternative Greek
> Symbols//EN//XML"
> --        uri="ent/iso-grk4.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Arrow
> Relations//EN//XML"
> --        uri="ent/iso-amsa.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Binary
> Operators//EN//XML"
> --        uri="ent/iso-amsb.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> Delimiters//EN//XML"
> --        uri="ent/iso-amsc.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Negated
> Relations//EN//XML"
> --        uri="ent/iso-amsn.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> Ordinary//EN//XML"
> --        uri="ent/iso-amso.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> Relations//EN//XML"
> --        uri="ent/iso-amsr.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Box and Line Drawing//EN//XML"
> --        uri="ent/iso-box.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Russian Cyrillic//EN//XML"
> --        uri="ent/iso-cyr1.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Non-Russian Cyrillic//EN//XML"
> --        uri="ent/iso-cyr2.ent"/>
> --
> - <!-- End of catalog data for DocBook XML V4.3
> ............................. -->
> - <!--
> ...................................................................... -->
> -
> -diff --git a/docbook-4.4/catalog.xml b/docbook-4.4/catalog.xml
> ---- a/docbook-4.4/catalog.xml
> -+++ b/docbook-4.4/catalog.xml
> -@@ -1,4 +1,7 @@
> - <?xml version='1.0'?>
> -+<!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML Catalog
> V1.0//EN"
> -+    "http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd
> ">
> -+
> - <catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog"
> prefer="public">
> -
> - <!--
> ...................................................................... -->
> -@@ -58,66 +61,6 @@
> - <public publicId="-//OASIS//ENTITIES DocBook Character Entities V4.4//EN"
> -         uri="dbcentx.mod"/>
> -
> --<!--
> ...................................................................... -->
> --<!-- ISO entity sets
> ...................................................... -->
> --
> --<public publicId="ISO 8879:1986//ENTITIES Diacritical Marks//EN//XML"
> --        uri="ent/isodia.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Numeric and Special
> Graphic//EN//XML"
> --        uri="ent/isonum.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Publishing//EN//XML"
> --        uri="ent/isopub.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES General Technical//EN//XML"
> --        uri="ent/isotech.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Added Latin 1//EN//XML"
> --        uri="ent/isolat1.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Added Latin 2//EN//XML"
> --        uri="ent/isolat2.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Greek Letters//EN//XML"
> --        uri="ent/isogrk1.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Monotoniko Greek//EN//XML"
> --        uri="ent/isogrk2.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Greek Symbols//EN//XML"
> --        uri="ent/isogrk3.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Alternative Greek
> Symbols//EN//XML"
> --        uri="ent/isogrk4.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Arrow
> Relations//EN//XML"
> --        uri="ent/isoamsa.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Binary
> Operators//EN//XML"
> --        uri="ent/isoamsb.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> Delimiters//EN//XML"
> --        uri="ent/isoamsc.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Negated
> Relations//EN//XML"
> --        uri="ent/isoamsn.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> Ordinary//EN//XML"
> --        uri="ent/isoamso.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> Relations//EN//XML"
> --        uri="ent/isoamsr.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Box and Line Drawing//EN//XML"
> --        uri="ent/isobox.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Russian Cyrillic//EN//XML"
> --        uri="ent/isocyr1.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Non-Russian Cyrillic//EN//XML"
> --        uri="ent/isocyr2.ent"/>
> --
> - <!-- End of catalog data for DocBook XML V4.4
> ............................. -->
> - <!--
> ...................................................................... -->
> -
> -diff --git a/docbook-4.5/catalog.xml b/docbook-4.5/catalog.xml
> ---- a/docbook-4.5/catalog.xml
> -+++ b/docbook-4.5/catalog.xml
> -@@ -1,4 +1,7 @@
> - <?xml version='1.0'?>
> -+<!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML Catalog
> V1.0//EN"
> -+    "http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd
> ">
> -+
> - <catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog"
> prefer="public">
> -
> - <!--
> ...................................................................... -->
> -@@ -58,66 +61,6 @@
> - <public publicId="-//OASIS//ENTITIES DocBook Character Entities V4.5//EN"
> -         uri="dbcentx.mod"/>
> -
> --<!--
> ...................................................................... -->
> --<!-- ISO entity sets
> ...................................................... -->
> --
> --<public publicId="ISO 8879:1986//ENTITIES Diacritical Marks//EN//XML"
> --        uri="ent/isodia.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Numeric and Special
> Graphic//EN//XML"
> --        uri="ent/isonum.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Publishing//EN//XML"
> --        uri="ent/isopub.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES General Technical//EN//XML"
> --        uri="ent/isotech.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Added Latin 1//EN//XML"
> --        uri="ent/isolat1.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Added Latin 2//EN//XML"
> --        uri="ent/isolat2.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Greek Letters//EN//XML"
> --        uri="ent/isogrk1.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Monotoniko Greek//EN//XML"
> --        uri="ent/isogrk2.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Greek Symbols//EN//XML"
> --        uri="ent/isogrk3.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Alternative Greek
> Symbols//EN//XML"
> --        uri="ent/isogrk4.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Arrow
> Relations//EN//XML"
> --        uri="ent/isoamsa.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Binary
> Operators//EN//XML"
> --        uri="ent/isoamsb.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> Delimiters//EN//XML"
> --        uri="ent/isoamsc.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols: Negated
> Relations//EN//XML"
> --        uri="ent/isoamsn.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> Ordinary//EN//XML"
> --        uri="ent/isoamso.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Added Math Symbols:
> Relations//EN//XML"
> --        uri="ent/isoamsr.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Box and Line Drawing//EN//XML"
> --        uri="ent/isobox.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Russian Cyrillic//EN//XML"
> --        uri="ent/isocyr1.ent"/>
> --
> --<public publicId="ISO 8879:1986//ENTITIES Non-Russian Cyrillic//EN//XML"
> --        uri="ent/isocyr2.ent"/>
> --
> - <!-- End of catalog data for DocBook XML V4.5
> ............................. -->
> - <!--
> ...................................................................... -->
> -
> ---
> -1.8.1.2
> -
> diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
> b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
> index 6452c8d99f..786ca5418f 100644
> --- a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
> +++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
> @@ -1,9 +1,10 @@
>  SUMMARY = "Document type definitions for verification of XML data files"
>  DESCRIPTION = "Document type definitions for verification of XML data \
> -files against the DocBook rule set, it ships with the latest DocBook 4.5 \
> -XML DTD, as well as a selected set of legacy DTDs for use with older \
> -documents, including 4.0, 4.1.2, 4.2, 4.3 and 4.4"
> -HOMEPAGE = "http://www.docbook.org/xml/"
> +files against the DocBook rule set. It ships with the latest DocBook 4.5 \
> +XML DTD, together with older version 4.2, 4.3 and 4.4."
> +HOMEPAGE = "https://www.docbook.org/xml/"
> +
> +PR = "r1"
>
>  LICENSE = "OASIS"
>  LIC_FILES_CHKSUM =
> "file://${WORKDIR}/LICENSE-OASIS;md5=c608985dd5f7f215e669e7639a0b1d2e"
> @@ -11,42 +12,37 @@ LIC_FILES_CHKSUM =
> "file://${WORKDIR}/LICENSE-OASIS;md5=c608985dd5f7f215e669e763
>  # Note: the upstream sources are not distributed with a license file.
>  # LICENSE-OASIS is included as a "patch" to workaround this. When
>  # upgrading this recipe, please verify whether this is still needed.
> -SRC_URI = "
> http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/d/docbook-xml/docbook-xml_${PV}.orig.tar.gz
> \
> -           file://LICENSE-OASIS \
> -           file://docbook-xml-update-catalog.xml.patch \
> +SRC_URI = "\
> +    file://LICENSE-OASIS \
> +    file://catalogs/* \
>  "
>
> -SRC_URI[md5sum] = "487b4d44e15cffb1f4048af23f98208e"
> -SRC_URI[sha256sum] =
> "b0f8edcf697f5318e63dd98c9a931f3fee167af0805ba441db372e0f17b2a44f"
> -
> -UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/docbook-xml/"
> -
> -S = "${WORKDIR}/docbook-xml-4.5.c31424"
> -
> -inherit allarch
> +inherit allarch xmlcatalog
>  BBCLASSEXTEND = "native"
>
> -do_configure (){
> -    :
> -}
> +# the XMLCATALOGS variable is used in xmlcatalog BB class
> +XMLCATALOGS = "${sysconfdir}/xml/docbook-xml.xml"
>
> -do_compile (){
> -    :
> -}
> +S = "${WORKDIR}"
> +
> +do_configure[noexec] = "1"
> +do_compile[noexec] = "1"
>
>  do_install () {
> +
>      install -d ${D}${sysconfdir}/xml/
>      xmlcatalog --create --noout ${D}${sysconfdir}/xml/docbook-xml.xml
>
> -    for DTDVERSION in 4.0 4.1.2 4.2 4.3 4.4 4.5; do
> -        DEST=${datadir}/xml/docbook/schema/dtd/$DTDVERSION
> +    for catalog in $(ls catalogs); do
> +        dtdVersion=$(echo ${catalog} | sed -rn
> 's/^catalog-([0-9].[0-9])\.xml/\1/p')
> +        DEST=${datadir}/xml/docbook/schema/dtd/${dtdVersion}
>          install -d -m 755 ${D}$DEST
> -        cp -v -R docbook-$DTDVERSION/* ${D}$DEST
> +        cp -v -R catalogs/catalog-${dtdVersion}.xml ${D}$DEST/catalog.xml
>          xmlcatalog --verbose --noout --add nextCatalog unused
> file://$DEST/catalog.xml ${D}${sysconfdir}/xml/docbook-xml.xml
>      done
>  }
>
> -XMLCATALOGS = "${sysconfdir}/xml/docbook-xml.xml"
> -inherit xmlcatalog
> -
> -FILES_${PN} = "${datadir}/* ${sysconfdir}/xml/docbook-xml.xml"
> +FILES_${PN} = "\
> +    ${datadir}/* \
> +    ${XMLCATALOGS} \
> +"
> --
> 2.26.2
>
> 
>

--000000000000ad92c405a655396b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Can the original source be fetched though? Copying th=
ings over into the layer itself is not the best option.</div><div><br></div=
><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Sat, 23 May 2020 at 19:20, Gregor Zatko &lt;<a href=
=3D"mailto:gzatko@gmail.com">gzatko@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">From: Gregor Zatko &lt;<a hre=
f=3D"mailto:gzatko@zoznam.sk" target=3D"_blank">gzatko@zoznam.sk</a>&gt;<br=
>
<br>
Until now a Debian package has been used as a source.<br>
This change just switches it to project&#39;s upstream.<br>
<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13270" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_b=
ug.cgi?id=3D13270</a><br>
<br>
Signed-off-by: Gregor Zatko &lt;<a href=3D"mailto:gzatko@gmail.com" target=
=
=3D"_blank">gzatko@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../docbook-xml-dtd4/catalogs/catalog-4.2.xml | 115 ++++<br>
=C2=A0.../docbook-xml-dtd4/catalogs/catalog-4.3.xml | 115 ++++<br>
=C2=A0.../docbook-xml-dtd4/catalogs/catalog-4.4.xml | 124 +++++<br>
=C2=A0.../docbook-xml-dtd4/catalogs/catalog-4.5.xml | 124 +++++<br>
=C2=A0.../docbook-xml-update-catalog.xml.patch=C2=A0 =C2=A0 =C2=A0 | 515 -=
-----------------<br>
=C2=A0.../docbook-xml/<a href=3D"http://docbook-xml-dtd4_4.5.bb" rel=3D"no=
referrer" target=3D"_blank">docbook-xml-dtd4_4.5.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 52 +-<br>
=C2=A06 files changed, 502 insertions(+), 543 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-dtd=
4/catalogs/catalog-4.2.xml<br>
=C2=A0create mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-dtd=
4/catalogs/catalog-4.3.xml<br>
=C2=A0create mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-dtd=
4/catalogs/catalog-4.4.xml<br>
=C2=A0create mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-dtd=
4/catalogs/catalog-4.5.xml<br>
=C2=A0delete mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-dtd=
4/docbook-xml-update-catalog.xml.patch<br>
<br>
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/c=
atalog-4.2.xml b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalog=
s/catalog-4.2.xml<br>
new file mode 100644<br>
index 0000000000..6920c2f7e0<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-=
4.2.xml<br>
@@ -0,0 +1,115 @@<br>
+&lt;?xml version=3D&#39;1.0&#39;?&gt;<br>
+&lt;catalog xmlns=3D&quot;urn:oasis:names:tc:entity:xmlns:xml:catalog&quo=
t;&gt;<br>
+<br>
+&lt;!-- .................................................................=
..... --&gt;<br>
+&lt;!-- XML Catalog data for DocBook XML V4.2 ...........................=
..... --&gt;<br>
+&lt;!-- File catalog.xml ................................................=
..... --&gt;<br>
+<br>
+&lt;!-- Please direct all questions, bug reports, or suggestions for<br>
+=C2=A0 =C2=A0 =C2=A0changes to the <a href=3D"mailto:docbook@lists.oasis-=
open.org" target=3D"_blank">docbook@lists.oasis-open.org</a> mailing list. =
For more<br>
+=C2=A0 =C2=A0 =C2=A0information, see <a href=3D"http://www.oasis-open.org=
/" rel=3D"noreferrer" target=3D"_blank">http://www.oasis-open.org/</a>.<br>
+=C2=A0 --&gt;<br>
+<br>
+&lt;!-- This is the catalog data file for DocBook V4.2. It is provided as=
<br>
+=C2=A0 =C2=A0 =C2=A0a convenience in building your own catalog files. You=
 need not use<br>
+=C2=A0 =C2=A0 =C2=A0the filenames listed here, and need not use the filen=
ame method of<br>
+=C2=A0 =C2=A0 =C2=A0identifying storage objects at all.=C2=A0 See the doc=
umentation for<br>
+=C2=A0 =C2=A0 =C2=A0detailed information on the files associated with the=
 DocBook DTD.<br>
+=C2=A0 =C2=A0 =C2=A0See XML Catalogs at <a href=3D"http://www.oasis-open.=
org/committees/entity/" rel=3D"noreferrer" target=3D"_blank">http://www.oas=
is-open.org/committees/entity/</a> for<br>
+=C2=A0 =C2=A0 =C2=A0detailed information on supplying and using catalog d=
ata.<br>
+=C2=A0 --&gt;<br>
+<br>
+&lt;!-- .................................................................=
..... --&gt;<br>
+&lt;!-- DocBook driver file .............................................=
..... --&gt;<br>
+<br>
+&lt;public publicId=3D&quot;-//OASIS//DTD DocBook XML V4.2//EN&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;docbookx.dtd&quot;/&gt;<br>
+<br>
+&lt;!-- .................................................................=
..... --&gt;<br>
+&lt;!-- DocBook modules .................................................=
..... --&gt;<br>
+<br>
+&lt;public publicId=3D&quot;-//OASIS//DTD DocBook CALS Table Model V4.2//=
EN&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;calstblx.dtd&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;-//OASIS//DTD XML Exchange Table Model 199903=
15//EN&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;soextblx.dtd&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;-//OASIS//ELEMENTS DocBook Information Pool V=
4.2//EN&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;dbpoolx.mod&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;-//OASIS//ELEMENTS DocBook Document Hierarchy=
 V4.2//EN&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;dbhierx.mod&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;-//OASIS//ENTITIES DocBook Additional General=
 Entities V4.2//EN&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;dbgenent.mod&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;-//OASIS//ENTITIES DocBook Notations V4.2//EN=
&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;dbnotnx.mod&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;-//OASIS//ENTITIES DocBook Character Entities=
 V4.2//EN&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;dbcentx.mod&quot;/&gt;<br>
+<br>
+&lt;!-- .................................................................=
..... --&gt;<br>
+&lt;!-- ISO entity sets .................................................=
..... --&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Diacritical Marks//EN=
//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-dia.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Numeric and Special G=
raphic//EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-num.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Publishing//EN//XML&q=
uot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-pub.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES General Technical//EN=
//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-tech.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Latin 1//EN//XM=
L&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-lat1.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Latin 2//EN//XM=
L&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-lat2.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Greek Letters//EN//XM=
L&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-grk1.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Monotoniko Greek//EN/=
/XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-grk2.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Greek Symbols//EN//XM=
L&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-grk3.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Alternative Greek Sym=
bols//EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-grk4.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: A=
rrow Relations//EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-amsa.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: B=
inary Operators//EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-amsb.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: D=
elimiters//EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-amsc.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: N=
egated Relations//EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-amsn.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: O=
rdinary//EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-amso.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: R=
elations//EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-amsr.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Box and Line Drawing/=
/EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-box.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Russian Cyrillic//EN/=
/XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-cyr1.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Non-Russian Cyrillic/=
/EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-cyr2.ent&quot;/&gt;<br>
+<br>
+&lt;!-- End of catalog data for DocBook XML V4.2 ........................=
..... --&gt;<br>
+&lt;!-- .................................................................=
..... --&gt;<br>
+<br>
+&lt;/catalog&gt;<br>
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/c=
atalog-4.3.xml b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalog=
s/catalog-4.3.xml<br>
new file mode 100644<br>
index 0000000000..34d1afdd94<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-=
4.3.xml<br>
@@ -0,0 +1,115 @@<br>
+&lt;?xml version=3D&#39;1.0&#39;?&gt;<br>
+&lt;catalog xmlns=3D&quot;urn:oasis:names:tc:entity:xmlns:xml:catalog&quo=
t;&gt;<br>
+<br>
+&lt;!-- .................................................................=
..... --&gt;<br>
+&lt;!-- XML Catalog data for DocBook XML V4.3 ...........................=
..... --&gt;<br>
+&lt;!-- File catalog.xml ................................................=
..... --&gt;<br>
+<br>
+&lt;!-- Please direct all questions, bug reports, or suggestions for<br>
+=C2=A0 =C2=A0 =C2=A0changes to the <a href=3D"mailto:docbook@lists.oasis-=
open.org" target=3D"_blank">docbook@lists.oasis-open.org</a> mailing list. =
For more<br>
+=C2=A0 =C2=A0 =C2=A0information, see <a href=3D"http://www.oasis-open.org=
/" rel=3D"noreferrer" target=3D"_blank">http://www.oasis-open.org/</a>.<br>
+=C2=A0 --&gt;<br>
+<br>
+&lt;!-- This is the catalog data file for DocBook V4.3. It is provided as=
<br>
+=C2=A0 =C2=A0 =C2=A0a convenience in building your own catalog files. You=
 need not use<br>
+=C2=A0 =C2=A0 =C2=A0the filenames listed here, and need not use the filen=
ame method of<br>
+=C2=A0 =C2=A0 =C2=A0identifying storage objects at all.=C2=A0 See the doc=
umentation for<br>
+=C2=A0 =C2=A0 =C2=A0detailed information on the files associated with the=
 DocBook DTD.<br>
+=C2=A0 =C2=A0 =C2=A0See XML Catalogs at <a href=3D"http://www.oasis-open.=
org/committees/entity/" rel=3D"noreferrer" target=3D"_blank">http://www.oas=
is-open.org/committees/entity/</a> for<br>
+=C2=A0 =C2=A0 =C2=A0detailed information on supplying and using catalog d=
ata.<br>
+=C2=A0 --&gt;<br>
+<br>
+&lt;!-- .................................................................=
..... --&gt;<br>
+&lt;!-- DocBook driver file .............................................=
..... --&gt;<br>
+<br>
+&lt;public publicId=3D&quot;-//OASIS//DTD DocBook XML V4.3//EN&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;docbookx.dtd&quot;/&gt;<br>
+<br>
+&lt;!-- .................................................................=
..... --&gt;<br>
+&lt;!-- DocBook modules .................................................=
..... --&gt;<br>
+<br>
+&lt;public publicId=3D&quot;-//OASIS//DTD DocBook CALS Table Model V4.3//=
EN&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;calstblx.dtd&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;-//OASIS//DTD XML Exchange Table Model 199903=
15//EN&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;soextblx.dtd&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;-//OASIS//ELEMENTS DocBook Information Pool V=
4.3//EN&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;dbpoolx.mod&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;-//OASIS//ELEMENTS DocBook Document Hierarchy=
 V4.3//EN&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;dbhierx.mod&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;-//OASIS//ENTITIES DocBook Additional General=
 Entities V4.3//EN&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;dbgenent.mod&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;-//OASIS//ENTITIES DocBook Notations V4.3//EN=
&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;dbnotnx.mod&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;-//OASIS//ENTITIES DocBook Character Entities=
 V4.3//EN&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;dbcentx.mod&quot;/&gt;<br>
+<br>
+&lt;!-- .................................................................=
..... --&gt;<br>
+&lt;!-- ISO entity sets .................................................=
..... --&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Diacritical Marks//EN=
//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-dia.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Numeric and Special G=
raphic//EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-num.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Publishing//EN//XML&q=
uot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-pub.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES General Technical//EN=
//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-tech.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Latin 1//EN//XM=
L&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-lat1.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Latin 2//EN//XM=
L&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-lat2.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Greek Letters//EN//XM=
L&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-grk1.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Monotoniko Greek//EN/=
/XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-grk2.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Greek Symbols//EN//XM=
L&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-grk3.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Alternative Greek Sym=
bols//EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-grk4.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: A=
rrow Relations//EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-amsa.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: B=
inary Operators//EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-amsb.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: D=
elimiters//EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-amsc.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: N=
egated Relations//EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-amsn.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: O=
rdinary//EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-amso.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: R=
elations//EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-amsr.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Box and Line Drawing/=
/EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-box.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Russian Cyrillic//EN/=
/XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-cyr1.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Non-Russian Cyrillic/=
/EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-cyr2.ent&quot;/&gt;<br>
+<br>
+&lt;!-- End of catalog data for DocBook XML V4.3 ........................=
..... --&gt;<br>
+&lt;!-- .................................................................=
..... --&gt;<br>
+<br>
+&lt;/catalog&gt;<br>
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/c=
atalog-4.4.xml b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalog=
s/catalog-4.4.xml<br>
new file mode 100644<br>
index 0000000000..8d709ba102<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-=
4.4.xml<br>
@@ -0,0 +1,124 @@<br>
+&lt;?xml version=3D&#39;1.0&#39;?&gt;<br>
+&lt;catalog xmlns=3D&quot;urn:oasis:names:tc:entity:xmlns:xml:catalog&quo=
t; prefer=3D&quot;public&quot;&gt;<br>
+<br>
+&lt;!-- .................................................................=
..... --&gt;<br>
+&lt;!-- XML Catalog data for DocBook XML V4.4 ...........................=
..... --&gt;<br>
+&lt;!-- File catalog.xml ................................................=
..... --&gt;<br>
+<br>
+&lt;!-- Please direct all questions, bug reports, or suggestions for<br>
+=C2=A0 =C2=A0 =C2=A0changes to the <a href=3D"mailto:docbook@lists.oasis-=
open.org" target=3D"_blank">docbook@lists.oasis-open.org</a> mailing list. =
For more<br>
+=C2=A0 =C2=A0 =C2=A0information, see <a href=3D"http://www.oasis-open.org=
/" rel=3D"noreferrer" target=3D"_blank">http://www.oasis-open.org/</a>.<br>
+=C2=A0 --&gt;<br>
+<br>
+&lt;!-- This is the catalog data file for DocBook V4.4. It is provided as=
<br>
+=C2=A0 =C2=A0 =C2=A0a convenience in building your own catalog files. You=
 need not use<br>
+=C2=A0 =C2=A0 =C2=A0the filenames listed here, and need not use the filen=
ame method of<br>
+=C2=A0 =C2=A0 =C2=A0identifying storage objects at all.=C2=A0 See the doc=
umentation for<br>
+=C2=A0 =C2=A0 =C2=A0detailed information on the files associated with the=
 DocBook DTD.<br>
+=C2=A0 =C2=A0 =C2=A0See XML Catalogs at <a href=3D"http://www.oasis-open.=
org/committees/entity/" rel=3D"noreferrer" target=3D"_blank">http://www.oas=
is-open.org/committees/entity/</a> for<br>
+=C2=A0 =C2=A0 =C2=A0detailed information on supplying and using catalog d=
ata.<br>
+=C2=A0 --&gt;<br>
+<br>
+&lt;!-- .................................................................=
..... --&gt;<br>
+&lt;!-- DocBook driver file .............................................=
..... --&gt;<br>
+<br>
+&lt;public publicId=3D&quot;-//OASIS//DTD DocBook XML V4.4//EN&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;docbookx.dtd&quot;/&gt;<br>
+<br>
+&lt;system systemId=3D&quot;<a href=3D"http://www.oasis-open.org/docbook/=
xml/4.4/docbookx.dtd" rel=3D"noreferrer" target=3D"_blank">http://www.oasis=
-open.org/docbook/xml/4.4/docbookx.dtd</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uri=3D&quot;docbookx.dtd&quot;/&gt;<br>
+<br>
+&lt;system systemId=3D&quot;<a href=3D"http://docbook.org/xml/4.4/docbook=
x.dtd" rel=3D"noreferrer" target=3D"_blank">http://docbook.org/xml/4.4/docb=
ookx.dtd</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uri=3D&quot;docbookx.dtd&quot;/&gt;<br>
+<br>
+&lt;!-- .................................................................=
..... --&gt;<br>
+&lt;!-- DocBook modules .................................................=
..... --&gt;<br>
+<br>
+&lt;public publicId=3D&quot;-//OASIS//DTD DocBook CALS Table Model V4.4//=
EN&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;calstblx.dtd&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;-//OASIS//ELEMENTS DocBook XML HTML Tables V4=
.4//EN&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uri=3D&quot;htmltblx.mod&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;-//OASIS//DTD XML Exchange Table Model 199903=
15//EN&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;soextblx.dtd&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;-//OASIS//ELEMENTS DocBook Information Pool V=
4.4//EN&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;dbpoolx.mod&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;-//OASIS//ELEMENTS DocBook Document Hierarchy=
 V4.4//EN&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;dbhierx.mod&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;-//OASIS//ENTITIES DocBook Additional General=
 Entities V4.4//EN&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;dbgenent.mod&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;-//OASIS//ENTITIES DocBook Notations V4.4//EN=
&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;dbnotnx.mod&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;-//OASIS//ENTITIES DocBook Character Entities=
 V4.4//EN&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;dbcentx.mod&quot;/&gt;<br>
+<br>
+&lt;!-- .................................................................=
..... --&gt;<br>
+&lt;!-- ISO entity sets .................................................=
..... --&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Diacritical Marks//EN=
//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isodia.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Numeric and Special G=
raphic//EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isonum.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Publishing//EN//XML&q=
uot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isopub.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES General Technical//EN=
//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isotech.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Latin 1//EN//XM=
L&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isolat1.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Latin 2//EN//XM=
L&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isolat2.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Greek Letters//EN//XM=
L&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isogrk1.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Monotoniko Greek//EN/=
/XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isogrk2.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Greek Symbols//EN//XM=
L&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isogrk3.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Alternative Greek Sym=
bols//EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isogrk4.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: A=
rrow Relations//EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isoamsa.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: B=
inary Operators//EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isoamsb.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: D=
elimiters//EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isoamsc.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: N=
egated Relations//EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isoamsn.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: O=
rdinary//EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isoamso.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: R=
elations//EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isoamsr.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Box and Line Drawing/=
/EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isobox.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Russian Cyrillic//EN/=
/XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isocyr1.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Non-Russian Cyrillic/=
/EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isocyr2.ent&quot;/&gt;<br>
+<br>
+&lt;!-- End of catalog data for DocBook XML V4.4 ........................=
..... --&gt;<br>
+&lt;!-- .................................................................=
..... --&gt;<br>
+<br>
+&lt;/catalog&gt;<br>
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/c=
atalog-4.5.xml b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalog=
s/catalog-4.5.xml<br>
new file mode 100644<br>
index 0000000000..f75c1d764d<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/catalogs/catalog-=
4.5.xml<br>
@@ -0,0 +1,124 @@<br>
+&lt;?xml version=3D&#39;1.0&#39;?&gt;<br>
+&lt;catalog xmlns=3D&quot;urn:oasis:names:tc:entity:xmlns:xml:catalog&quo=
t; prefer=3D&quot;public&quot;&gt;<br>
+<br>
+&lt;!-- .................................................................=
..... --&gt;<br>
+&lt;!-- XML Catalog data for DocBook XML V4.5 ...........................=
..... --&gt;<br>
+&lt;!-- File catalog.xml ................................................=
..... --&gt;<br>
+<br>
+&lt;!-- Please direct all questions, bug reports, or suggestions for<br>
+=C2=A0 =C2=A0 =C2=A0changes to the <a href=3D"mailto:docbook@lists.oasis-=
open.org" target=3D"_blank">docbook@lists.oasis-open.org</a> mailing list. =
For more<br>
+=C2=A0 =C2=A0 =C2=A0information, see <a href=3D"http://www.oasis-open.org=
/" rel=3D"noreferrer" target=3D"_blank">http://www.oasis-open.org/</a>.<br>
+=C2=A0 --&gt;<br>
+<br>
+&lt;!-- This is the catalog data file for DocBook V4.5. It is provided as=
<br>
+=C2=A0 =C2=A0 =C2=A0a convenience in building your own catalog files. You=
 need not use<br>
+=C2=A0 =C2=A0 =C2=A0the filenames listed here, and need not use the filen=
ame method of<br>
+=C2=A0 =C2=A0 =C2=A0identifying storage objects at all.=C2=A0 See the doc=
umentation for<br>
+=C2=A0 =C2=A0 =C2=A0detailed information on the files associated with the=
 DocBook DTD.<br>
+=C2=A0 =C2=A0 =C2=A0See XML Catalogs at <a href=3D"http://www.oasis-open.=
org/committees/entity/" rel=3D"noreferrer" target=3D"_blank">http://www.oas=
is-open.org/committees/entity/</a> for<br>
+=C2=A0 =C2=A0 =C2=A0detailed information on supplying and using catalog d=
ata.<br>
+=C2=A0 --&gt;<br>
+<br>
+&lt;!-- .................................................................=
..... --&gt;<br>
+&lt;!-- DocBook driver file .............................................=
..... --&gt;<br>
+<br>
+&lt;public publicId=3D&quot;-//OASIS//DTD DocBook XML V4.5//EN&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;docbookx.dtd&quot;/&gt;<br>
+<br>
+&lt;system systemId=3D&quot;<a href=3D"http://www.oasis-open.org/docbook/=
xml/4.5/docbookx.dtd" rel=3D"noreferrer" target=3D"_blank">http://www.oasis=
-open.org/docbook/xml/4.5/docbookx.dtd</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uri=3D&quot;docbookx.dtd&quot;/&gt;<br>
+<br>
+&lt;system systemId=3D&quot;<a href=3D"http://docbook.org/xml/4.5/docbook=
x.dtd" rel=3D"noreferrer" target=3D"_blank">http://docbook.org/xml/4.5/docb=
ookx.dtd</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uri=3D&quot;docbookx.dtd&quot;/&gt;<br>
+<br>
+&lt;!-- .................................................................=
..... --&gt;<br>
+&lt;!-- DocBook modules .................................................=
..... --&gt;<br>
+<br>
+&lt;public publicId=3D&quot;-//OASIS//DTD DocBook CALS Table Model V4.5//=
EN&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;calstblx.dtd&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;-//OASIS//ELEMENTS DocBook XML HTML Tables V4=
.5//EN&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uri=3D&quot;htmltblx.mod&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;-//OASIS//DTD XML Exchange Table Model 199903=
15//EN&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;soextblx.dtd&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;-//OASIS//ELEMENTS DocBook Information Pool V=
4.5//EN&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;dbpoolx.mod&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;-//OASIS//ELEMENTS DocBook Document Hierarchy=
 V4.5//EN&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;dbhierx.mod&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;-//OASIS//ENTITIES DocBook Additional General=
 Entities V4.5//EN&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;dbgenent.mod&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;-//OASIS//ENTITIES DocBook Notations V4.5//EN=
&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;dbnotnx.mod&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;-//OASIS//ENTITIES DocBook Character Entities=
 V4.5//EN&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;dbcentx.mod&quot;/&gt;<br>
+<br>
+&lt;!-- .................................................................=
..... --&gt;<br>
+&lt;!-- ISO entity sets .................................................=
..... --&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Diacritical Marks//EN=
//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isodia.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Numeric and Special G=
raphic//EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isonum.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Publishing//EN//XML&q=
uot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isopub.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES General Technical//EN=
//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isotech.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Latin 1//EN//XM=
L&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isolat1.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Latin 2//EN//XM=
L&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isolat2.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Greek Letters//EN//XM=
L&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isogrk1.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Monotoniko Greek//EN/=
/XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isogrk2.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Greek Symbols//EN//XM=
L&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isogrk3.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Alternative Greek Sym=
bols//EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isogrk4.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: A=
rrow Relations//EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isoamsa.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: B=
inary Operators//EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isoamsb.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: D=
elimiters//EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isoamsc.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: N=
egated Relations//EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isoamsn.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: O=
rdinary//EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isoamso.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: R=
elations//EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isoamsr.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Box and Line Drawing/=
/EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isobox.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Russian Cyrillic//EN/=
/XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isocyr1.ent&quot;/&gt;<br>
+<br>
+&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Non-Russian Cyrillic/=
/EN//XML&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isocyr2.ent&quot;/&gt;<br>
+<br>
+&lt;!-- End of catalog data for DocBook XML V4.5 ........................=
..... --&gt;<br>
+&lt;!-- .................................................................=
..... --&gt;<br>
+<br>
+&lt;/catalog&gt;<br>
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xm=
l-update-catalog.xml.patch b/meta/recipes-devtools/docbook-xml/docbook-xml-=
dtd4/docbook-xml-update-catalog.xml.patch<br>
deleted file mode 100644<br>
index 59703609ca..0000000000<br>
--- a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xml-updat=
e-catalog.xml.patch<br>
+++ /dev/null<br>
@@ -1,515 +0,0 @@<br>
-docbook-xml: update catalog.xml<br>
-<br>
-Refer Ubuntu 13.04 to update catalog.xml<br>
-<br>
-Upstream-Status: Pending<br>
-Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com"=
 target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
----<br>
- docbook-4.0/catalog.xml=C2=A0 =C2=A0| 72 +++++++++++++++++++++++++++++++=
++++++++++++++++<br>
- docbook-4.1.2/catalog.xml | 66 +++++++++++++++++++++++++++++++++++++++++=
++<br>
- docbook-4.2/catalog.xml=C2=A0 =C2=A0| 69 ++++++-------------------------=
--------------<br>
- docbook-4.3/catalog.xml=C2=A0 =C2=A0| 72 ++++++++-----------------------=
----------------<br>
- docbook-4.4/catalog.xml=C2=A0 =C2=A0| 63 ++-----------------------------=
----------<br>
- docbook-4.5/catalog.xml=C2=A0 =C2=A0| 63 ++-----------------------------=
----------<br>
- 6 files changed, 165 insertions(+), 240 deletions(-)<br>
- create mode 100644 docbook-4.0/catalog.xml<br>
- create mode 100644 docbook-4.1.2/catalog.xml<br>
-<br>
-diff --git a/docbook-4.0/catalog.xml b/docbook-4.0/catalog.xml<br>
-new file mode 100644<br>
---- /dev/null<br>
-+++ b/docbook-4.0/catalog.xml<br>
-@@ -0,0 +1,72 @@<br>
-+&lt;?xml version=3D&#39;1.0&#39;?&gt;<br>
-+&lt;!DOCTYPE catalog PUBLIC &quot;-//OASIS//DTD Entity Resolution XML Ca=
talog V1.0//EN&quot; <br>
-+=C2=A0 =C2=A0 &quot;<a href=3D"http://www.oasis-open.org/committees/enti=
ty/release/1.0/catalog.dtd" rel=3D"noreferrer" target=3D"_blank">http://www=
.oasis-open.org/committees/entity/release/1.0/catalog.dtd</a>&quot;&gt;<br>
-+<br>
-+&lt;catalog xmlns=3D&quot;urn:oasis:names:tc:entity:xmlns:xml:catalog&qu=
ot;&gt;<br>
-+<br>
-+&lt;!-- ................................................................=
...... --&gt;<br>
-+&lt;!-- XML Catalog data for DocBook XML V4.0...........................=
.... --&gt;<br>
-+&lt;!-- File catalog.xml ...............................................=
...... --&gt;<br>
-+<br>
-+&lt;!-- Please direct all questions, bug reports, or suggestions for<br>
-+=C2=A0 =C2=A0 =C2=A0changes to the <a href=3D"mailto:docbook@lists.oasis=
-open.org" target=3D"_blank">docbook@lists.oasis-open.org</a> mailing list.=
 For more<br>
-+=C2=A0 =C2=A0 =C2=A0information, see <a href=3D"http://www.oasis-open.or=
g/" rel=3D"noreferrer" target=3D"_blank">http://www.oasis-open.org/</a>.<br=
>
-+=C2=A0 --&gt;<br>
-+<br>
-+&lt;!-- This is the catalog data file for DocBook V4.0. It is provided a=
s<br>
-+=C2=A0 =C2=A0 =C2=A0a convenience in building your own catalog files. Yo=
u need not use<br>
-+=C2=A0 =C2=A0 =C2=A0the filenames listed here, and need not use the file=
name method of<br>
-+=C2=A0 =C2=A0 =C2=A0identifying storage objects at all.=C2=A0 See the do=
cumentation for<br>
-+=C2=A0 =C2=A0 =C2=A0detailed information on the files associated with th=
e DocBook DTD.<br>
-+=C2=A0 =C2=A0 =C2=A0See XML Catalogs at <a href=3D"http://www.oasis-open=
.org/committees/entity/" rel=3D"noreferrer" target=3D"_blank">http://www.oa=
sis-open.org/committees/entity/</a> for<br>
-+=C2=A0 =C2=A0 =C2=A0detailed information on supplying and using catalog =
data.<br>
-+=C2=A0 --&gt;<br>
-+<br>
-+&lt;!-- ................................................................=
...... --&gt;<br>
-+&lt;!-- DocBook driver file ............................................=
...... --&gt;<br>
-+<br>
-+&lt;public publicId=3D&quot;-//Norman Walsh//DTD DocBk XML V4.0//EN&quot=
;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;docbookx.dtd&quot;/&gt;<br>
-+<br>
-+&lt;!-- Other ways to refer to DocBook XML v4.0.........................=
...... --&gt;<br>
-+&lt;public publicId=3D&quot;-//Norman Walsh//DTD DocBook XML V4.0//EN&qu=
ot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;docbookx.dtd&quot;/&gt;<br>
-+<br>
-+&lt;system systemId=3D&quot;<a href=3D"http://www.oasis-open.org/docbook=
/xml/4.0/docbookx.dtd" rel=3D"noreferrer" target=3D"_blank">http://www.oasi=
s-open.org/docbook/xml/4.0/docbookx.dtd</a>&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;docbookx.dtd&quot;/&gt;<br>
-+<br>
-+&lt;!-- ................................................................=
...... --&gt;<br>
-+&lt;!-- DocBook modules ................................................=
...... --&gt;<br>
-+<br>
-+&lt;public publicId=3D&quot;-//Norman Walsh//ENTITIES DocBook XML Notati=
ons V4.0//EN&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;dbnotnx.mod&quot;/&gt;<br>
-+<br>
-+&lt;public publicId=3D&quot;-//Norman Walsh//ENTITIES DocBook XML Charac=
ter Entities V4.0//EN&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;dbcentx.mod&quot;/&gt;<br>
-+<br>
-+&lt;public publicId=3D&quot;-//Norman Walsh//ELEMENTS DocBook XML Inform=
ation Pool V4.0//EN&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;dbpoolx.mod&quot;/&gt;<br>
-+<br>
-+&lt;public publicId=3D&quot;-//Norman Walsh//ELEMENTS DocBook XML Docume=
nt Hierarchy V4.0//EN&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;dbhierx.mod&quot;/&gt;<br>
-+<br>
-+&lt;public publicId=3D&quot;-//Norman Walsh//ENTITIES DocBook XML Additi=
onal General Entities V4.0//EN&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;dbgenent.mod&quot;/&gt;<br>
-+<br>
-+&lt;public publicId=3D&quot;-//Norman Walsh//DTD CALS Table Model XML V4=
.0//EN&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;calstblx.dtd&quot;/&gt;<br>
-+<br>
-+&lt;!-- UNOFFICIAL conversion of the exchange table model to XML, based =
on the OASIS Exchange --&gt;<br>
-+&lt;!--=C2=A0 =C2=A0 Table Model PUBLIC &quot;-//SGML Open//DTD Exchange=
 Table Model 19960430//EN&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--&=
gt;<br>
-+&lt;public publicId=3D&quot;-//Normal Walsh//Exchange Table Model 199604=
30 XML V4.0//EN&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;soextblx.dtd&quot;/&gt;<br>
-+<br>
-+&lt;!-- the following FPI is declared for the DTD inside the DTD, but we=
&#39;ll --&gt;<br>
-+&lt;!-- use the version from the latest DocBook<br>
-+&lt;public publicId=3D&quot;-//OASIS//DTD XML Exchange Table Model 19990=
315//EN&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;soextblx.dtd&quot;/&gt; --&gt;<b=
r>
-+<br>
-+&lt;!-- End of catalog data for DocBook XML V4.0 .......................=
...... --&gt;<br>
-+&lt;!-- ................................................................=
...... --&gt;<br>
-+<br>
-+&lt;/catalog&gt;<br>
-diff --git a/docbook-4.1.2/catalog.xml b/docbook-4.1.2/catalog.xml<br>
-new file mode 100644<br>
---- /dev/null<br>
-+++ b/docbook-4.1.2/catalog.xml<br>
-@@ -0,0 +1,66 @@<br>
-+&lt;?xml version=3D&#39;1.0&#39;?&gt;<br>
-+&lt;!DOCTYPE catalog PUBLIC &quot;-//OASIS//DTD Entity Resolution XML Ca=
talog V1.0//EN&quot; <br>
-+=C2=A0 =C2=A0 &quot;<a href=3D"http://www.oasis-open.org/committees/enti=
ty/release/1.0/catalog.dtd" rel=3D"noreferrer" target=3D"_blank">http://www=
.oasis-open.org/committees/entity/release/1.0/catalog.dtd</a>&quot;&gt;<br>
-+<br>
-+&lt;catalog xmlns=3D&quot;urn:oasis:names:tc:entity:xmlns:xml:catalog&qu=
ot;&gt;<br>
-+<br>
-+&lt;!-- ................................................................=
...... --&gt;<br>
-+&lt;!-- XML Catalog data for DocBook XML V4.1.2.........................=
...... --&gt;<br>
-+&lt;!-- File catalog.xml ...............................................=
...... --&gt;<br>
-+<br>
-+&lt;!-- Please direct all questions, bug reports, or suggestions for<br>
-+=C2=A0 =C2=A0 =C2=A0changes to the <a href=3D"mailto:docbook@lists.oasis=
-open.org" target=3D"_blank">docbook@lists.oasis-open.org</a> mailing list.=
 For more<br>
-+=C2=A0 =C2=A0 =C2=A0information, see <a href=3D"http://www.oasis-open.or=
g/" rel=3D"noreferrer" target=3D"_blank">http://www.oasis-open.org/</a>.<br=
>
-+=C2=A0 --&gt;<br>
-+<br>
-+&lt;!-- This is the catalog data file for DocBook V4.1.2. It is provided=
 as<br>
-+=C2=A0 =C2=A0 =C2=A0a convenience in building your own catalog files. Yo=
u need not use<br>
-+=C2=A0 =C2=A0 =C2=A0the filenames listed here, and need not use the file=
name method of<br>
-+=C2=A0 =C2=A0 =C2=A0identifying storage objects at all.=C2=A0 See the do=
cumentation for<br>
-+=C2=A0 =C2=A0 =C2=A0detailed information on the files associated with th=
e DocBook DTD.<br>
-+=C2=A0 =C2=A0 =C2=A0See XML Catalogs at <a href=3D"http://www.oasis-open=
.org/committees/entity/" rel=3D"noreferrer" target=3D"_blank">http://www.oa=
sis-open.org/committees/entity/</a> for<br>
-+=C2=A0 =C2=A0 =C2=A0detailed information on supplying and using catalog =
data.<br>
-+=C2=A0 --&gt;<br>
-+<br>
-+&lt;!-- ................................................................=
...... --&gt;<br>
-+&lt;!-- DocBook driver file ............................................=
...... --&gt;<br>
-+<br>
-+&lt;public publicId=3D&quot;-//OASIS//DTD DocBook XML V4.1.2//EN&quot;<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;docbookx.dtd&quot;/&gt;<br>
-+<br>
-+&lt;system systemId=3D&quot;<a href=3D"http://www.oasis-open.org/docbook=
/xml/4.1.2/docbookx.dtd" rel=3D"noreferrer" target=3D"_blank">http://www.oa=
sis-open.org/docbook/xml/4.1.2/docbookx.dtd</a>&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;docbookx.dtd&quot;/&gt;<br>
-+<br>
-+&lt;system systemId=3D&quot;<a href=3D"http://docbook.org/xml/4.1.2/docb=
ookx.dtd" rel=3D"noreferrer" target=3D"_blank">http://docbook.org/xml/4.1.2=
/docbookx.dtd</a>&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;docbookx.dtd&quot;/&gt;<br>
-+<br>
-+&lt;!-- ................................................................=
...... --&gt;<br>
-+&lt;!-- DocBook modules ................................................=
...... --&gt;<br>
-+<br>
-+&lt;public publicId=3D&quot;-//OASIS//DTD DocBook CALS Table Model V4.1.=
2//EN&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;calstblx.dtd&quot;/&gt;<br>
-+<br>
-+=C2=A0 &lt;!-- already included in docbook 4.2<br>
-+&lt;public publicId=3D&quot;-//OASIS//DTD XML Exchange Table Model 19990=
315//EN&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;soextblx.dtd&quot;/&gt; --&gt;<b=
r>
-+<br>
-+&lt;public publicId=3D&quot;-//OASIS//ELEMENTS DocBook XML Information P=
ool V4.1.2//EN&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;dbpoolx.mod&quot;/&gt;<br>
-+<br>
-+&lt;public publicId=3D&quot;-//OASIS//ELEMENTS DocBook Document Hierarch=
y V4.1.2//EN&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;dbhierx.mod&quot;/&gt;<br>
-+<br>
-+&lt;public publicId=3D&quot;-//OASIS//ENTITIES DocBook Additional Genera=
l Entities V4.1.2//EN&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;dbgenent.mod&quot;/&gt;<br>
-+<br>
-+&lt;public publicId=3D&quot;-//OASIS//ENTITIES DocBook Notations V4.1.2/=
/EN&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;dbnotnx.mod&quot;/&gt;<br>
-+<br>
-+&lt;public publicId=3D&quot;-//OASIS//ENTITIES DocBook Character Entitie=
s V4.1.2//EN&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;dbcentx.mod&quot;/&gt;<br>
-+<br>
-+<br>
-+&lt;!-- End of catalog data for DocBook XML V4.1.2 .....................=
........ --&gt;<br>
-+&lt;!-- ................................................................=
...... --&gt;<br>
-+<br>
-+&lt;/catalog&gt;<br>
-diff --git a/docbook-4.2/catalog.xml b/docbook-4.2/catalog.xml<br>
---- a/docbook-4.2/catalog.xml<br>
-+++ b/docbook-4.2/catalog.xml<br>
-@@ -1,4 +1,7 @@<br>
- &lt;?xml version=3D&#39;1.0&#39;?&gt;<br>
-+&lt;!DOCTYPE catalog PUBLIC &quot;-//OASIS//DTD Entity Resolution XML Ca=
talog V1.0//EN&quot;<br>
-+=C2=A0 =C2=A0 &quot;<a href=3D"http://www.oasis-open.org/committees/enti=
ty/release/1.0/catalog.dtd" rel=3D"noreferrer" target=3D"_blank">http://www=
.oasis-open.org/committees/entity/release/1.0/catalog.dtd</a>&quot;&gt;<br>
-+<br>
- &lt;catalog xmlns=3D&quot;urn:oasis:names:tc:entity:xmlns:xml:catalog&qu=
ot;&gt;<br>
- <br>
- &lt;!-- ................................................................=
...... --&gt;<br>
-@@ -25,6 +28,12 @@<br>
- &lt;public publicId=3D&quot;-//OASIS//DTD DocBook XML V4.2//EN&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uri=3D&quot;docbookx.dtd&quot;/&gt;<br>
- <br>
-+&lt;system systemId=3D&quot;<a href=3D"http://www.oasis-open.org/docbook=
/xml/4.2/docbookx.dtd" rel=3D"noreferrer" target=3D"_blank">http://www.oasi=
s-open.org/docbook/xml/4.2/docbookx.dtd</a>&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;docbookx.dtd&quot;/&gt;<br>
-+<br>
-+&lt;system systemId=3D&quot;<a href=3D"http://docbook.org/xml/4.2/docboo=
kx.dtd" rel=3D"noreferrer" target=3D"_blank">http://docbook.org/xml/4.2/doc=
bookx.dtd</a>&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;docbookx.dtd&quot;/&gt;<br>
-+<br>
- &lt;!-- ................................................................=
...... --&gt;<br>
- &lt;!-- DocBook modules ................................................=
...... --&gt;<br>
- <br>
-@@ -49,66 +58,6 @@<br>
- &lt;public publicId=3D&quot;-//OASIS//ENTITIES DocBook Character Entitie=
s V4.2//EN&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uri=3D&quot;dbcentx.mod&quot;/&gt;<br>
- <br>
--&lt;!-- ................................................................=
...... --&gt;<br>
--&lt;!-- ISO entity sets ................................................=
...... --&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Diacritical Marks//E=
N//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-dia.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Numeric and Special =
Graphic//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-num.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Publishing//EN//XML&=
quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-pub.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES General Technical//E=
N//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-tech.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Latin 1//EN//X=
ML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-lat1.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Latin 2//EN//X=
ML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-lat2.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Greek Letters//EN//X=
ML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-grk1.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Monotoniko Greek//EN=
//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-grk2.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Greek Symbols//EN//X=
ML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-grk3.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Alternative Greek Sy=
mbols//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-grk4.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: =
Arrow Relations//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-amsa.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: =
Binary Operators//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-amsb.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: =
Delimiters//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-amsc.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: =
Negated Relations//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-amsn.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: =
Ordinary//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-amso.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: =
Relations//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-amsr.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Box and Line Drawing=
//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-box.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Russian Cyrillic//EN=
//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-cyr1.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Non-Russian Cyrillic=
//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-cyr2.ent&quot;/&gt;<br>
--<br>
- &lt;!-- End of catalog data for DocBook XML V4.2 .......................=
...... --&gt;<br>
- &lt;!-- ................................................................=
...... --&gt;<br>
- <br>
-diff --git a/docbook-4.3/catalog.xml b/docbook-4.3/catalog.xml<br>
---- a/docbook-4.3/catalog.xml<br>
-+++ b/docbook-4.3/catalog.xml<br>
-@@ -1,4 +1,7 @@<br>
- &lt;?xml version=3D&#39;1.0&#39;?&gt;<br>
-+&lt;!DOCTYPE catalog PUBLIC &quot;-//OASIS//DTD Entity Resolution XML Ca=
talog V1.0//EN&quot;<br>
-+=C2=A0 =C2=A0 &quot;<a href=3D"http://www.oasis-open.org/committees/enti=
ty/release/1.0/catalog.dtd" rel=3D"noreferrer" target=3D"_blank">http://www=
.oasis-open.org/committees/entity/release/1.0/catalog.dtd</a>&quot;&gt;<br>
-+<br>
- &lt;catalog xmlns=3D&quot;urn:oasis:names:tc:entity:xmlns:xml:catalog&qu=
ot;&gt;<br>
- <br>
- &lt;!-- ................................................................=
...... --&gt;<br>
-@@ -25,12 +28,21 @@<br>
- &lt;public publicId=3D&quot;-//OASIS//DTD DocBook XML V4.3//EN&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uri=3D&quot;docbookx.dtd&quot;/&gt;<br>
- <br>
-+&lt;system systemId=3D&quot;<a href=3D"http://www.oasis-open.org/docbook=
/xml/4.3/docbookx.dtd" rel=3D"noreferrer" target=3D"_blank">http://www.oasi=
s-open.org/docbook/xml/4.3/docbookx.dtd</a>&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;docbookx.dtd&quot;/&gt;<br>
-+<br>
-+&lt;system systemId=3D&quot;<a href=3D"http://docbook.org/xml/4.3/docboo=
kx.dtd" rel=3D"noreferrer" target=3D"_blank">http://docbook.org/xml/4.3/doc=
bookx.dtd</a>&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;docbookx.dtd&quot;/&gt;<br>
-+<br>
- &lt;!-- ................................................................=
...... --&gt;<br>
- &lt;!-- DocBook modules ................................................=
...... --&gt;<br>
- <br>
- &lt;public publicId=3D&quot;-//OASIS//DTD DocBook CALS Table Model V4.3/=
/EN&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uri=3D&quot;calstblx.dtd&quot;/&gt;<br>
- <br>
-+&lt;public publicId=3D&quot;-//OASIS//ELEMENTS DocBook XML HTML Tables V=
4.3//EN&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;htmltblx.mod&quot;/&gt;<br>
-+<br>
- &lt;public publicId=3D&quot;-//OASIS//DTD XML Exchange Table Model 19990=
315//EN&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uri=3D&quot;soextblx.dtd&quot;/&gt;<br>
- <br>
-@@ -49,66 +61,6 @@<br>
- &lt;public publicId=3D&quot;-//OASIS//ENTITIES DocBook Character Entitie=
s V4.3//EN&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uri=3D&quot;dbcentx.mod&quot;/&gt;<br>
- <br>
--&lt;!-- ................................................................=
...... --&gt;<br>
--&lt;!-- ISO entity sets ................................................=
...... --&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Diacritical Marks//E=
N//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-dia.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Numeric and Special =
Graphic//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-num.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Publishing//EN//XML&=
quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-pub.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES General Technical//E=
N//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-tech.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Latin 1//EN//X=
ML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-lat1.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Latin 2//EN//X=
ML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-lat2.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Greek Letters//EN//X=
ML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-grk1.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Monotoniko Greek//EN=
//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-grk2.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Greek Symbols//EN//X=
ML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-grk3.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Alternative Greek Sy=
mbols//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-grk4.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: =
Arrow Relations//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-amsa.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: =
Binary Operators//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-amsb.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: =
Delimiters//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-amsc.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: =
Negated Relations//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-amsn.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: =
Ordinary//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-amso.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: =
Relations//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-amsr.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Box and Line Drawing=
//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-box.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Russian Cyrillic//EN=
//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-cyr1.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Non-Russian Cyrillic=
//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/iso-cyr2.ent&quot;/&gt;<br>
--<br>
- &lt;!-- End of catalog data for DocBook XML V4.3 .......................=
...... --&gt;<br>
- &lt;!-- ................................................................=
...... --&gt;<br>
- <br>
-diff --git a/docbook-4.4/catalog.xml b/docbook-4.4/catalog.xml<br>
---- a/docbook-4.4/catalog.xml<br>
-+++ b/docbook-4.4/catalog.xml<br>
-@@ -1,4 +1,7 @@<br>
- &lt;?xml version=3D&#39;1.0&#39;?&gt;<br>
-+&lt;!DOCTYPE catalog PUBLIC &quot;-//OASIS//DTD Entity Resolution XML Ca=
talog V1.0//EN&quot;<br>
-+=C2=A0 =C2=A0 &quot;<a href=3D"http://www.oasis-open.org/committees/enti=
ty/release/1.0/catalog.dtd" rel=3D"noreferrer" target=3D"_blank">http://www=
.oasis-open.org/committees/entity/release/1.0/catalog.dtd</a>&quot;&gt;<br>
-+<br>
- &lt;catalog xmlns=3D&quot;urn:oasis:names:tc:entity:xmlns:xml:catalog&qu=
ot; prefer=3D&quot;public&quot;&gt;<br>
- <br>
- &lt;!-- ................................................................=
...... --&gt;<br>
-@@ -58,66 +61,6 @@<br>
- &lt;public publicId=3D&quot;-//OASIS//ENTITIES DocBook Character Entitie=
s V4.4//EN&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uri=3D&quot;dbcentx.mod&quot;/&gt;<br>
- <br>
--&lt;!-- ................................................................=
...... --&gt;<br>
--&lt;!-- ISO entity sets ................................................=
...... --&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Diacritical Marks//E=
N//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isodia.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Numeric and Special =
Graphic//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isonum.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Publishing//EN//XML&=
quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isopub.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES General Technical//E=
N//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isotech.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Latin 1//EN//X=
ML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isolat1.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Latin 2//EN//X=
ML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isolat2.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Greek Letters//EN//X=
ML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isogrk1.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Monotoniko Greek//EN=
//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isogrk2.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Greek Symbols//EN//X=
ML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isogrk3.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Alternative Greek Sy=
mbols//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isogrk4.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: =
Arrow Relations//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isoamsa.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: =
Binary Operators//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isoamsb.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: =
Delimiters//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isoamsc.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: =
Negated Relations//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isoamsn.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: =
Ordinary//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isoamso.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: =
Relations//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isoamsr.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Box and Line Drawing=
//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isobox.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Russian Cyrillic//EN=
//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isocyr1.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Non-Russian Cyrillic=
//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isocyr2.ent&quot;/&gt;<br>
--<br>
- &lt;!-- End of catalog data for DocBook XML V4.4 .......................=
...... --&gt;<br>
- &lt;!-- ................................................................=
...... --&gt;<br>
- <br>
-diff --git a/docbook-4.5/catalog.xml b/docbook-4.5/catalog.xml<br>
---- a/docbook-4.5/catalog.xml<br>
-+++ b/docbook-4.5/catalog.xml<br>
-@@ -1,4 +1,7 @@<br>
- &lt;?xml version=3D&#39;1.0&#39;?&gt;<br>
-+&lt;!DOCTYPE catalog PUBLIC &quot;-//OASIS//DTD Entity Resolution XML Ca=
talog V1.0//EN&quot;<br>
-+=C2=A0 =C2=A0 &quot;<a href=3D"http://www.oasis-open.org/committees/enti=
ty/release/1.0/catalog.dtd" rel=3D"noreferrer" target=3D"_blank">http://www=
.oasis-open.org/committees/entity/release/1.0/catalog.dtd</a>&quot;&gt;<br>
-+<br>
- &lt;catalog xmlns=3D&quot;urn:oasis:names:tc:entity:xmlns:xml:catalog&qu=
ot; prefer=3D&quot;public&quot;&gt;<br>
- <br>
- &lt;!-- ................................................................=
...... --&gt;<br>
-@@ -58,66 +61,6 @@<br>
- &lt;public publicId=3D&quot;-//OASIS//ENTITIES DocBook Character Entitie=
s V4.5//EN&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uri=3D&quot;dbcentx.mod&quot;/&gt;<br>
- <br>
--&lt;!-- ................................................................=
...... --&gt;<br>
--&lt;!-- ISO entity sets ................................................=
...... --&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Diacritical Marks//E=
N//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isodia.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Numeric and Special =
Graphic//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isonum.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Publishing//EN//XML&=
quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isopub.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES General Technical//E=
N//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isotech.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Latin 1//EN//X=
ML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isolat1.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Latin 2//EN//X=
ML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isolat2.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Greek Letters//EN//X=
ML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isogrk1.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Monotoniko Greek//EN=
//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isogrk2.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Greek Symbols//EN//X=
ML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isogrk3.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Alternative Greek Sy=
mbols//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isogrk4.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: =
Arrow Relations//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isoamsa.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: =
Binary Operators//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isoamsb.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: =
Delimiters//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isoamsc.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: =
Negated Relations//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isoamsn.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: =
Ordinary//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isoamso.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Added Math Symbols: =
Relations//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isoamsr.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Box and Line Drawing=
//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isobox.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Russian Cyrillic//EN=
//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isocyr1.ent&quot;/&gt;<br>
--<br>
--&lt;public publicId=3D&quot;ISO 8879:1986//ENTITIES Non-Russian Cyrillic=
//EN//XML&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 uri=3D&quot;ent/isocyr2.ent&quot;/&gt;<br>
--<br>
- &lt;!-- End of catalog data for DocBook XML V4.5 .......................=
...... --&gt;<br>
- &lt;!-- ................................................................=
...... --&gt;<br>
- <br>
--- <br>
-1.8.1.2<br>
-<br>
diff --git a/meta/recipes-devtools/docbook-xml/<a href=3D"http://docbook-x=
ml-dtd4_4.5.bb" rel=3D"noreferrer" target=3D"_blank">docbook-xml-dtd4_4.5.b=
b</a> b/meta/recipes-devtools/docbook-xml/<a href=3D"http://docbook-xml-dtd=
4_4.5.bb" rel=3D"noreferrer" target=3D"_blank">docbook-xml-dtd4_4.5.bb</a><=
br>
index 6452c8d99f..786ca5418f 100644<br>
--- a/meta/recipes-devtools/docbook-xml/<a href=3D"http://docbook-xml-dtd4=
_4.5.bb" rel=3D"noreferrer" target=3D"_blank">docbook-xml-dtd4_4.5.bb</a><b=
r>
+++ b/meta/recipes-devtools/docbook-xml/<a href=3D"http://docbook-xml-dtd4=
_4.5.bb" rel=3D"noreferrer" target=3D"_blank">docbook-xml-dtd4_4.5.bb</a><b=
r>
@@ -1,9 +1,10 @@<br>
=C2=A0SUMMARY =3D &quot;Document type definitions for verification of XML =
data files&quot;<br>
=C2=A0DESCRIPTION =3D &quot;Document type definitions for verification of =
XML data \<br>
-files against the DocBook rule set, it ships with the latest DocBook 4.5 =
\<br>
-XML DTD, as well as a selected set of legacy DTDs for use with older \<br=
>
-documents, including 4.0, 4.1.2, 4.2, 4.3 and 4.4&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"http://www.docbook.org/xml/" rel=3D"norefer=
rer" target=3D"_blank">http://www.docbook.org/xml/</a>&quot;<br>
+files against the DocBook rule set. It ships with the latest DocBook 4.5 =
\<br>
+XML DTD, together with older version 4.2, 4.3 and 4.4.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://www.docbook.org/xml/" rel=3D"norefe=
rrer" target=3D"_blank">https://www.docbook.org/xml/</a>&quot;<br>
+<br>
+PR =3D &quot;r1&quot;<br>
<br>
=C2=A0LICENSE =3D &quot;OASIS&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://${WORKDIR}/LICENSE-OASIS;md5=3Dc60=
8985dd5f7f215e669e7639a0b1d2e&quot;<br>
@@ -11,42 +12,37 @@ LIC_FILES_CHKSUM =3D &quot;file://${WORKDIR}/LICENSE-O=
ASIS;md5=3Dc608985dd5f7f215e669e763<br>
=C2=A0# Note: the upstream sources are not distributed with a license file=
.<br>
=C2=A0# LICENSE-OASIS is included as a &quot;patch&quot; to workaround thi=
s. When<br>
=C2=A0# upgrading this recipe, please verify whether this is still needed.=
<br>
-SRC_URI =3D &quot;<a href=3D"http://snapshot.debian.org/archive/debian/20=
160728T043443Z/pool/main/d/docbook-xml/docbook-xml_$%7BPV%7D.orig.tar.gz" r=
el=3D"noreferrer" target=3D"_blank">http://snapshot.debian.org/archive/debi=
an/20160728T043443Z/pool/main/d/docbook-xml/docbook-xml_${PV}.orig.tar.gz</=
a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://LICENSE-OASIS \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://docbook-xml-update-catalo=
g.xml.patch \<br>
+SRC_URI =3D &quot;\<br>
+=C2=A0 =C2=A0 file://LICENSE-OASIS \<br>
+=C2=A0 =C2=A0 file://catalogs/* \<br>
=C2=A0&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;487b4d44e15cffb1f4048af23f98208e&quot;<br>
-SRC_URI[sha256sum] =3D &quot;b0f8edcf697f5318e63dd98c9a931f3fee167af0805b=
a441db372e0f17b2a44f&quot;<br>
-<br>
-UPSTREAM_CHECK_URI =3D &quot;${DEBIAN_MIRROR}/main/d/docbook-xml/&quot;<b=
r>
-<br>
-S =3D &quot;${WORKDIR}/docbook-xml-4.5.c31424&quot;<br>
-<br>
-inherit allarch<br>
+inherit allarch xmlcatalog<br>
=C2=A0BBCLASSEXTEND =3D &quot;native&quot;<br>
<br>
-do_configure (){<br>
-=C2=A0 =C2=A0 :<br>
-}<br>
+# the XMLCATALOGS variable is used in xmlcatalog BB class<br>
+XMLCATALOGS =3D &quot;${sysconfdir}/xml/docbook-xml.xml&quot;<br>
<br>
-do_compile (){<br>
-=C2=A0 =C2=A0 :<br>
-}<br>
+S =3D &quot;${WORKDIR}&quot;<br>
+<br>
+do_configure[noexec] =3D &quot;1&quot;<br>
+do_compile[noexec] =3D &quot;1&quot;<br>
<br>
=C2=A0do_install () {<br>
+<br>
=C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/xml/<br>
=C2=A0 =C2=A0 =C2=A0xmlcatalog --create --noout ${D}${sysconfdir}/xml/docb=
ook-xml.xml<br>
<br>
-=C2=A0 =C2=A0 for DTDVERSION in 4.0 4.1.2 4.2 4.3 4.4 4.5; do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 DEST=3D${datadir}/xml/docbook/schema/dtd/$DTD=
VERSION<br>
+=C2=A0 =C2=A0 for catalog in $(ls catalogs); do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dtdVersion=3D$(echo ${catalog} | sed -rn &#39=
;s/^catalog-([0-9].[0-9])\.xml/\1/p&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 DEST=3D${datadir}/xml/docbook/schema/dtd/${dt=
dVersion}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d -m 755 ${D}$DEST<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -v -R docbook-$DTDVERSION/* ${D}$DEST<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -v -R catalogs/catalog-${dtdVersion}.xml $=
{D}$DEST/catalog.xml<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xmlcatalog --verbose --noout --add nextC=
atalog unused file://$DEST/catalog.xml ${D}${sysconfdir}/xml/docbook-xml.xm=
l<br>
=C2=A0 =C2=A0 =C2=A0done<br>
=C2=A0}<br>
<br>
-XMLCATALOGS =3D &quot;${sysconfdir}/xml/docbook-xml.xml&quot;<br>
-inherit xmlcatalog<br>
-<br>
-FILES_${PN} =3D &quot;${datadir}/* ${sysconfdir}/xml/docbook-xml.xml&quot=
;<br>
+FILES_${PN} =3D &quot;\<br>
+=C2=A0 =C2=A0 ${datadir}/* \<br>
+=C2=A0 =C2=A0 ${XMLCATALOGS} \<br>
+&quot;<br>
-- <br>
2.26.2<br>
<br>
<br>
</blockquote></div>

--000000000000ad92c405a655396b--
