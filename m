Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
 by mx.groups.io with SMTP id smtpd.web08.1827.1621281097517842354
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 12:51:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KnFjKVJN;
 spf=pass (domain: gmail.com, ip: 209.85.221.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f170.google.com with SMTP id u205so1575489vke.10
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 12:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ad55odbWCEuSSCPf0ghKUzvQrE8OQLt/4sV0uNRvuOk=;
        b=KnFjKVJNZ0jOKCu7yyF25rcMDYWk13Wam/kjf4/JWK1Ng6oLDIPWzxl4Kpg04CUFkD
         DtWiiJRPAH+KXVnkv4UMb6HsTuVU2YbCGLt15KypdqNk9MAPvrquWqOGsRWDwsI3X50f
         8cdl04R3msKLLCupY/8hzNAcXQyhGbcaGo0A8wHvOYIhu9e3QPF7BgGYtBuSx9xXnP+E
         kZDatZRhA/e9kyTi3Oe+NsU6k9hgUQjygANx3Aa0a0VqJfzY8RcaogrXB195EI2b0fFn
         dkY8wl4MThx/oHeULW00DqfGJre8MoGjV+E4TJOzsfP/uNZVeQ2uIPQI0hUlxD8+OFss
         DZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ad55odbWCEuSSCPf0ghKUzvQrE8OQLt/4sV0uNRvuOk=;
        b=OsRjOkYJKf9qR12xlvizAwne+U2+7dkaDAP9ztRIMtF8Z1XqWkqQ/HC5keGg/+ucxu
         nOk10PtP49Cl84IlMnXFeLhCT5crBh9cRBG2QvLUCOU77DW6CR+6BK3cK3khJcRQstCS
         taXjjgWoRmfvm19PNdBBuZgEVrkkOEJLuaNZHfnrj1E8ru9/FmD8icjOM3mRDZvz3yWZ
         ekrTIkjrS6Y6rC2cwb3FH0Vtrr/rNLBAJiYcuav1+U3GZWCotLAugJdmZwmCyEo66Rsr
         7aoiSU01AEVtuY55SnE6A/1kMA4SJ8yH5YUX7qRmEAK43u71Ixj1cY+CFRhcUEMOxNBf
         QSkA==
X-Gm-Message-State: AOAM532CpgIx0iKMtGCvv+vWufCdjWSURw6sGqUwIYs6opd6GQdj1MeK
	ZJthAlEF5Ff0Y0vsMLseMV8dXqgx0+Rg1ZYKFr74Q5P3nV4=
X-Google-Smtp-Source: ABdhPJxO2PC9J6u9RPF7FDeZ15MnH7kYhcZPArlh4R4kxj+a6VDELpx8W7OHFyfKnv9RC3KyhKTL5g9goZx9vnsNrNY=
X-Received: by 2002:a1f:9d46:: with SMTP id g67mr1686070vke.10.1621281096450;
 Mon, 17 May 2021 12:51:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210517170104.2605486-1-jacob.kroon@gmail.com>
 <CAJ86T=VuX0rhvRbUYF+yA4pao222Mfbj2RBmj5V21SEtdB+rTg@mail.gmail.com> <70b3da50-5a1f-584d-9ff6-b9e4c1577292@kernel.crashing.org>
In-Reply-To: <70b3da50-5a1f-584d-9ff6-b9e4c1577292@kernel.crashing.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 17 May 2021 21:51:24 +0200
Message-ID: <CANNYZj8HyiT_-GkY=tdmHJsmZHgeM8i_Aow89TsVmrpCeYHinA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mklibs-native: Fix build with gcc 11
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d5c5fa05c28bebea"

--000000000000d5c5fa05c28bebea
Content-Type: text/plain; charset="UTF-8"

FWIW, I have had patches to drop mklibs for a long time:
http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates-later

I'd be happy to send them again.

Alex

On Mon, 17 May 2021 at 21:50, Mark Hatle <mark.hatle@kernel.crashing.org>
wrote:

>
>
> On 5/17/21 2:46 PM, Andre McCurdy wrote:
> > On Mon, May 17, 2021 at 10:05 AM Jacob Kroon <jacob.kroon@gmail.com>
> wrote:
> >>
> >> In gcc 11 the default mode for C++ is now -std=gnu++17 instead of
> -std=gnu++14,
> >> in which support for dynamic exception specifications has been removed.
> >
> > As much as I'd like to see mklibs fully supported in OE, at some point
> > maybe we should just admit that it doesn't work and there's not enough
> > collective motivation to fix it.
> >
> > For mklibs to work, the build process should generate a PIC .a archive
> > for every .so shared library (ie static libs need to be built and
> > somehow forced to contain PIC object code - which may mean patching
> > Makefiles etc) and then the PIC .a files need to be available
> > alongside the .so libs when mklibs runs. We don't have any support for
> > doing that, so why keep pretending to support mklibs?
>
> We used to have exactly that.  The fact nobody is complaining it doesn't
> work
> tells me nobody is using this and we should remove it.
>
> The need for this on modern (embedded) systems is significantly less with a
> function altnerative to glibc.  (musl)
>
> --Mark
>
> >> See
> http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2016/p0003r5.html
> >>
> >> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> >> ---
> >>  .../no-dynamic-exception-specifications.patch | 420 ++++++++++++++++++
> >>  .../mklibs/mklibs-native_0.1.44.bb            |   1 +
> >>  2 files changed, 421 insertions(+)
> >>  create mode 100644
> meta/recipes-devtools/mklibs/files/no-dynamic-exception-specifications.patch
> >>
> >> diff --git
> a/meta/recipes-devtools/mklibs/files/no-dynamic-exception-specifications.patch
> b/meta/recipes-devtools/mklibs/files/no-dynamic-exception-specifications.patch
> >> new file mode 100644
> >> index 0000000000..5989a67c4f
> >> --- /dev/null
> >> +++
> b/meta/recipes-devtools/mklibs/files/no-dynamic-exception-specifications.patch
> >> @@ -0,0 +1,420 @@
> >> +In gcc 11 the default mode for C++ is now -std=gnu++17 instead of
> -std=gnu++14,
> >> +in which support for dynamic exception specifications has been removed.
> >> +
> >> +See
> http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2016/p0003r5.html
> >> +
> >> +Upstream-Status: Pending
> >> +
> >> +Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> >> +
> >> +Index: mklibs-0.1.44/src/mklibs-readelf/elf.cpp
> >> +===================================================================
> >> +--- mklibs-0.1.44.orig/src/mklibs-readelf/elf.cpp
> >> ++++ mklibs-0.1.44/src/mklibs-readelf/elf.cpp
> >> +@@ -36,7 +36,7 @@ file::~file () throw ()
> >> +     delete *it;
> >> + }
> >> +
> >> +-file *file::open (const char *filename) throw (std::bad_alloc,
> std::runtime_error)
> >> ++file *file::open (const char *filename)
> >> + {
> >> +   struct stat buf;
> >> +   int fd;
> >> +@@ -72,7 +72,7 @@ file *file::open (const char *filename)
> >> + }
> >> +
> >> + template<typename _class>
> >> +-file *file::open_class(uint8_t *mem, size_t len) throw
> (std::bad_alloc, std::runtime_error)
> >> ++file *file::open_class(uint8_t *mem, size_t len)
> >> + {
> >> +   switch (mem[EI_DATA])
> >> +   {
> >> +@@ -86,7 +86,7 @@ file *file::open_class(uint8_t *mem, siz
> >> + }
> >> +
> >> + template <typename _class, typename _data>
> >> +-file_data<_class, _data>::file_data(uint8_t *mem, size_t len) throw
> (std::bad_alloc, std::runtime_error)
> >> ++file_data<_class, _data>::file_data(uint8_t *mem, size_t len)
> >> + : file(mem, len)
> >> + {
> >> +   if (mem[EI_CLASS] != _class::id)
> >> +@@ -190,7 +190,7 @@ section_data<_class, _data>::section_dat
> >> + }
> >> +
> >> + template <typename _class, typename _data>
> >> +-void section_data<_class, _data>::update(const file &file) throw
> (std::bad_alloc)
> >> ++void section_data<_class, _data>::update(const file &file)
> >> + {
> >> +   const section_type<section_type_STRTAB> &section =
> >> +     dynamic_cast<const section_type<section_type_STRTAB>
> &>(file.get_section(file.get_shstrndx()));
> >> +@@ -204,7 +204,7 @@ section_type<section_type_DYNAMIC>::~sec
> >> + }
> >> +
> >> + template <typename _class, typename _data>
> >> +-section_real<_class, _data, section_type_DYNAMIC>::section_real(Shdr
> *header, uint8_t *mem) throw (std::bad_alloc)
> >> ++section_real<_class, _data, section_type_DYNAMIC>::section_real(Shdr
> *header, uint8_t *mem)
> >> + : section_data<_class, _data>(header, mem)
> >> + {
> >> +   if (this->type != SHT_DYNAMIC)
> >> +@@ -221,7 +221,7 @@ section_real<_class, _data, section_type
> >> + }
> >> +
> >> + template <typename _class, typename _data>
> >> +-void section_real<_class, _data, section_type_DYNAMIC>::update(const
> file &file) throw (std::bad_alloc)
> >> ++void section_real<_class, _data, section_type_DYNAMIC>::update(const
> file &file)
> >> + {
> >> +   section_data<_class, _data>::update(file);
> >> +
> >> +@@ -243,7 +243,7 @@ section_type<section_type_DYNSYM>::~sect
> >> + }
> >> +
> >> + template <typename _class, typename _data>
> >> +-section_real<_class, _data, section_type_DYNSYM>::section_real(Shdr
> *header, uint8_t *mem) throw (std::bad_alloc)
> >> ++section_real<_class, _data, section_type_DYNSYM>::section_real(Shdr
> *header, uint8_t *mem)
> >> + : section_data<_class, _data>(header, mem)
> >> + {
> >> +   if (this->type != SHT_DYNSYM)
> >> +@@ -260,7 +260,7 @@ section_real<_class, _data, section_type
> >> + }
> >> +
> >> + template <typename _class, typename _data>
> >> +-void section_real<_class, _data, section_type_DYNSYM>::update(const
> file &file) throw (std::bad_alloc)
> >> ++void section_real<_class, _data, section_type_DYNSYM>::update(const
> file &file)
> >> + {
> >> +   section_data<_class, _data>::update (file);
> >> +
> >> +@@ -285,7 +285,7 @@ const version_definition *section_type<s
> >> + }
> >> +
> >> + template <typename _class, typename _data>
> >> +-section_real<_class, _data,
> section_type_GNU_VERDEF>::section_real(Shdr *header, uint8_t *mem) throw
> (std::bad_alloc)
> >> ++section_real<_class, _data,
> section_type_GNU_VERDEF>::section_real(Shdr *header, uint8_t *mem)
> >> + : section_data<_class, _data>(header, mem)
> >> + {
> >> +   if (this->type != SHT_GNU_verdef)
> >> +@@ -307,7 +307,7 @@ section_real<_class, _data, section_type
> >> + }
> >> +
> >> + template <typename _class, typename _data>
> >> +-void section_real<_class, _data,
> section_type_GNU_VERDEF>::update(const file &file) throw (std::bad_alloc)
> >> ++void section_real<_class, _data,
> section_type_GNU_VERDEF>::update(const file &file)
> >> + {
> >> +   section_data<_class, _data>::update(file);
> >> +
> >> +@@ -333,7 +333,7 @@ const version_requirement_entry *section
> >> +
> >> + template <typename _class, typename _data>
> >> + section_real<_class, _data, section_type_GNU_VERNEED>::
> >> +-section_real(Shdr *header, uint8_t *mem) throw (std::bad_alloc)
> >> ++section_real(Shdr *header, uint8_t *mem)
> >> + : section_data<_class, _data> (header, mem)
> >> + {
> >> +   if (this->type != SHT_GNU_verneed)
> >> +@@ -355,7 +355,7 @@ section_real(Shdr *header, uint8_t *mem)
> >> + }
> >> +
> >> + template <typename _class, typename _data>
> >> +-void section_real<_class, _data,
> section_type_GNU_VERNEED>::update(const file &file) throw (std::bad_alloc)
> >> ++void section_real<_class, _data,
> section_type_GNU_VERNEED>::update(const file &file)
> >> + {
> >> +   section_data<_class, _data>::update(file);
> >> +
> >> +@@ -372,7 +372,7 @@ void section_real<_class, _data, section
> >> +
> >> + template <typename _class, typename _data>
> >> + section_real<_class, _data, section_type_GNU_VERSYM>::
> >> +-section_real (Shdr *header, uint8_t *mem) throw (std::bad_alloc)
> >> ++section_real (Shdr *header, uint8_t *mem)
> >> + : section_data<_class, _data> (header, mem)
> >> + {
> >> +   if (this->type != SHT_GNU_versym)
> >> +@@ -399,7 +399,7 @@ segment_data<_class, _data>::segment_dat
> >> + }
> >> +
> >> + template <typename _class, typename _data>
> >> +-segment_real<_class, _data, segment_type_INTERP>::segment_real (Phdr
> *header, uint8_t *mem) throw (std::bad_alloc)
> >> ++segment_real<_class, _data, segment_type_INTERP>::segment_real (Phdr
> *header, uint8_t *mem)
> >> + : segment_data<_class, _data> (header, mem)
> >> + {
> >> +   if (this->type != PT_INTERP)
> >> +@@ -429,13 +429,13 @@ dynamic_data<_class, _data>::dynamic_dat
> >> + }
> >> +
> >> + template <typename _class, typename _data>
> >> +-void dynamic_data<_class, _data>::update_string(const
> section_type<section_type_STRTAB> &section) throw (std::bad_alloc)
> >> ++void dynamic_data<_class, _data>::update_string(const
> section_type<section_type_STRTAB> &section)
> >> + {
> >> +   if (is_string)
> >> +     val_string = section.get_string(val);
> >> + }
> >> +
> >> +-std::string symbol::get_version () const throw (std::bad_alloc)
> >> ++std::string symbol::get_version () const
> >> + {
> >> +   if (verneed)
> >> +     return verneed->get_name();
> >> +@@ -445,7 +445,7 @@ std::string symbol::get_version () const
> >> +   return "Base";
> >> + }
> >> +
> >> +-std::string symbol::get_version_file () const throw (std::bad_alloc)
> >> ++std::string symbol::get_version_file () const
> >> + {
> >> +   if (verneed)
> >> +     return verneed->get_file();
> >> +@@ -453,7 +453,7 @@ std::string symbol::get_version_file ()
> >> +   return "None";
> >> + }
> >> +
> >> +-std::string symbol::get_name_version () const throw (std::bad_alloc)
> >> ++std::string symbol::get_name_version () const
> >> + {
> >> +   std::string ver;
> >> +
> >> +@@ -478,13 +478,13 @@ symbol_data<_class, _data>::symbol_data
> >> + }
> >> +
> >> + template <typename _class, typename _data>
> >> +-void symbol_data<_class, _data>::update_string(const
> section_type<section_type_STRTAB> &section) throw (std::bad_alloc)
> >> ++void symbol_data<_class, _data>::update_string(const
> section_type<section_type_STRTAB> &section)
> >> + {
> >> +   name_string = section.get_string(name);
> >> + }
> >> +
> >> + template <typename _class, typename _data>
> >> +-void symbol_data<_class, _data>::update_version(const file &file,
> uint16_t index) throw (std::bad_alloc)
> >> ++void symbol_data<_class, _data>::update_version(const file &file,
> uint16_t index)
> >> + {
> >> +   if (!file.get_section_GNU_VERSYM())
> >> +     return;
> >> +@@ -531,13 +531,13 @@ version_definition_data<_class, _data>::
> >> + }
> >> +
> >> + template <typename _class, typename _data>
> >> +-void version_definition_data<_class, _data>::update_string(const
> section_type<section_type_STRTAB> &section) throw (std::bad_alloc)
> >> ++void version_definition_data<_class, _data>::update_string(const
> section_type<section_type_STRTAB> &section)
> >> + {
> >> +   for (std::vector<uint32_t>::iterator it = names.begin(); it !=
> names.end(); ++it)
> >> +     names_string.push_back(section.get_string(*it));
> >> + }
> >> +
> >> +-version_requirement::version_requirement() throw (std::bad_alloc)
> >> ++version_requirement::version_requirement()
> >> + : file_string("None")
> >> + { }
> >> +
> >> +@@ -561,7 +561,7 @@ version_requirement_data<_class, _data>:
> >> +
> >> + template <typename _class, typename _data>
> >> + void version_requirement_data<_class, _data>::
> >> +-update_string(const section_type<section_type_STRTAB> &section) throw
> (std::bad_alloc)
> >> ++update_string(const section_type<section_type_STRTAB> &section)
> >> + {
> >> +   file_string = section.get_string(file);
> >> +
> >> +@@ -596,7 +596,7 @@ version_requirement_entry_data(Vernaux *
> >> +
> >> + template <typename _class, typename _data>
> >> + void version_requirement_entry_data<_class, _data>::
> >> +-update_string(const section_type<section_type_STRTAB> &section) throw
> (std::bad_alloc)
> >> ++update_string(const section_type<section_type_STRTAB> &section)
> >> + {
> >> +   name_string = section.get_string(name);
> >> + }
> >> +Index: mklibs-0.1.44/src/mklibs-readelf/elf.hpp
> >> +===================================================================
> >> +--- mklibs-0.1.44.orig/src/mklibs-readelf/elf.hpp
> >> ++++ mklibs-0.1.44/src/mklibs-readelf/elf.hpp
> >> +@@ -49,7 +49,7 @@ namespace Elf
> >> +       const uint16_t get_shstrndx() const throw () { return shstrndx;
> }
> >> +
> >> +       const std::vector<section *> get_sections() const throw () {
> return sections; };
> >> +-      const section &get_section(unsigned int i) const throw
> (std::out_of_range) { return *sections.at(i); };
> >> ++      const section &get_section(unsigned int i) const { return *
> sections.at(i); };
> >> +       const section_type<section_type_DYNAMIC> *get_section_DYNAMIC()
> const throw () { return section_DYNAMIC; };
> >> +       const section_type<section_type_DYNSYM> *get_section_DYNSYM()
> const throw () { return section_DYNSYM; };
> >> +       const section_type<section_type_GNU_VERDEF>
> *get_section_GNU_VERDEF() const throw () { return section_GNU_VERDEF; };
> >> +@@ -59,13 +59,13 @@ namespace Elf
> >> +       const std::vector<segment *> get_segments() const throw () {
> return segments; };
> >> +       const segment_type<segment_type_INTERP> *get_segment_INTERP()
> const throw () { return segment_INTERP; };
> >> +
> >> +-      static file *open(const char *filename) throw (std::bad_alloc,
> std::runtime_error);
> >> ++      static file *open(const char *filename);
> >> +
> >> +     protected:
> >> +-      file(uint8_t *mem, size_t len) throw (std::bad_alloc) :
> mem(mem), len(len) { }
> >> ++      file(uint8_t *mem, size_t len) : mem(mem), len(len) { }
> >> +
> >> +       template<typename _class>
> >> +-        static file *open_class(uint8_t *, size_t) throw
> (std::bad_alloc, std::runtime_error);
> >> ++        static file *open_class(uint8_t *, size_t);
> >> +
> >> +       uint16_t type;
> >> +       uint16_t machine;
> >> +@@ -128,7 +128,7 @@ namespace Elf
> >> +     class section_type<section_type_STRTAB> : public virtual section
> >> +     {
> >> +       public:
> >> +-        std::string get_string(uint32_t offset) const throw
> (std::bad_alloc)
> >> ++        std::string get_string(uint32_t offset) const
> >> +         {
> >> +           return std::string(reinterpret_cast<const char *> (mem +
> offset));
> >> +         }
> >> +@@ -263,10 +263,10 @@ namespace Elf
> >> +       uint8_t get_bind () const throw () { return bind; }
> >> +       uint8_t get_type () const throw () { return type; }
> >> +       const std::string &get_name_string() const throw () { return
> name_string; }
> >> +-      std::string get_version() const throw (std::bad_alloc);
> >> +-      std::string get_version_file() const throw (std::bad_alloc);
> >> ++      std::string get_version() const;
> >> ++      std::string get_version_file() const;
> >> +       uint16_t get_version_data() const throw () { return versym; }
> >> +-      std::string get_name_version() const throw (std::bad_alloc);
> >> ++      std::string get_name_version() const;
> >> +
> >> +     protected:
> >> +       uint32_t name;
> >> +@@ -305,7 +305,7 @@ namespace Elf
> >> +   class version_requirement
> >> +   {
> >> +     public:
> >> +-      version_requirement() throw (std::bad_alloc);
> >> ++      version_requirement();
> >> +       virtual ~version_requirement () throw () { }
> >> +
> >> +       const std::string &get_file() const throw () { return
> file_string; }
> >> +Index: mklibs-0.1.44/src/mklibs-readelf/elf_data.hpp
> >> +===================================================================
> >> +--- mklibs-0.1.44.orig/src/mklibs-readelf/elf_data.hpp
> >> ++++ mklibs-0.1.44/src/mklibs-readelf/elf_data.hpp
> >> +@@ -94,7 +94,7 @@ namespace Elf
> >> +     class file_data : public file
> >> +     {
> >> +       public:
> >> +-        file_data(uint8_t *, size_t len) throw (std::bad_alloc,
> std::runtime_error);
> >> ++        file_data(uint8_t *, size_t len);
> >> +
> >> +         const uint8_t get_class() const throw () { return _class::id;
> }
> >> +         const uint8_t get_data() const throw () { return _data::id; }
> >> +@@ -109,7 +109,7 @@ namespace Elf
> >> +       public:
> >> +         section_data(Shdr *, uint8_t *) throw ();
> >> +
> >> +-        virtual void update(const file &) throw (std::bad_alloc);
> >> ++        virtual void update(const file &);
> >> +     };
> >> +
> >> +   template <typename _class, typename _data, typename _type>
> >> +@@ -133,9 +133,9 @@ namespace Elf
> >> +         typedef typename _elfdef<_class>::Shdr Shdr;
> >> +
> >> +       public:
> >> +-        section_real(Shdr *, uint8_t *) throw (std::bad_alloc);
> >> ++        section_real(Shdr *, uint8_t *);
> >> +
> >> +-        void update(const file &) throw (std::bad_alloc);
> >> ++        void update(const file &);
> >> +     };
> >> +
> >> +   template <typename _class, typename _data>
> >> +@@ -147,9 +147,9 @@ namespace Elf
> >> +         typedef typename _elfdef<_class>::Shdr Shdr;
> >> +
> >> +       public:
> >> +-        section_real(Shdr *, uint8_t *) throw (std::bad_alloc);
> >> ++        section_real(Shdr *, uint8_t *);
> >> +
> >> +-        void update(const file &) throw (std::bad_alloc);
> >> ++        void update(const file &);
> >> +     };
> >> +
> >> +   template <typename _class, typename _data>
> >> +@@ -161,9 +161,9 @@ namespace Elf
> >> +         typedef typename _elfdef<_class>::Shdr Shdr;
> >> +
> >> +       public:
> >> +-        section_real(Shdr *, uint8_t *) throw (std::bad_alloc);
> >> ++        section_real(Shdr *, uint8_t *);
> >> +
> >> +-        void update(const file &) throw (std::bad_alloc);
> >> ++        void update(const file &);
> >> +     };
> >> +
> >> +   template <typename _class, typename _data>
> >> +@@ -175,9 +175,9 @@ namespace Elf
> >> +         typedef typename _elfdef<_class>::Shdr Shdr;
> >> +
> >> +       public:
> >> +-        section_real(Shdr *, uint8_t *) throw (std::bad_alloc);
> >> ++        section_real(Shdr *, uint8_t *);
> >> +
> >> +-        void update(const file &) throw (std::bad_alloc);
> >> ++        void update(const file &);
> >> +     };
> >> +
> >> +   template <typename _class, typename _data>
> >> +@@ -189,7 +189,7 @@ namespace Elf
> >> +         typedef typename _elfdef<_class>::Shdr Shdr;
> >> +
> >> +       public:
> >> +-        section_real(Shdr *, uint8_t *) throw (std::bad_alloc);
> >> ++        section_real(Shdr *, uint8_t *);
> >> +     };
> >> +
> >> +   template <typename _class, typename _data>
> >> +@@ -220,7 +220,7 @@ namespace Elf
> >> +         typedef typename _elfdef<_class>::Phdr Phdr;
> >> +
> >> +       public:
> >> +-        segment_real (Phdr *, uint8_t *) throw (std::bad_alloc);
> >> ++        segment_real (Phdr *, uint8_t *);
> >> +     };
> >> +
> >> +   template <typename _class, typename _data>
> >> +@@ -232,7 +232,7 @@ namespace Elf
> >> +       public:
> >> +         dynamic_data (Dyn *) throw ();
> >> +
> >> +-        void update_string(const section_type<section_type_STRTAB> &)
> throw (std::bad_alloc);
> >> ++        void update_string(const section_type<section_type_STRTAB> &);
> >> +     };
> >> +
> >> +   template <typename _class, typename _data>
> >> +@@ -244,8 +244,8 @@ namespace Elf
> >> +       public:
> >> +         symbol_data (Sym *) throw ();
> >> +
> >> +-        void update_string(const section_type<section_type_STRTAB> &)
> throw (std::bad_alloc);
> >> +-        virtual void update_version (const file &, uint16_t) throw
> (std::bad_alloc);
> >> ++        void update_string(const section_type<section_type_STRTAB> &);
> >> ++        virtual void update_version (const file &, uint16_t);
> >> +     };
> >> +
> >> +   template <typename _class, typename _data>
> >> +@@ -257,7 +257,7 @@ namespace Elf
> >> +
> >> +         version_definition_data (Verdef *) throw ();
> >> +
> >> +-        void update_string(const section_type<section_type_STRTAB> &)
> throw (std::bad_alloc);
> >> ++        void update_string(const section_type<section_type_STRTAB> &);
> >> +     };
> >> +
> >> +   template <typename _class, typename _data>
> >> +@@ -269,7 +269,7 @@ namespace Elf
> >> +
> >> +         version_requirement_data (Verneed *) throw ();
> >> +
> >> +-        void update_string(const section_type<section_type_STRTAB> &)
> throw (std::bad_alloc);
> >> ++        void update_string(const section_type<section_type_STRTAB> &);
> >> +     };
> >> +
> >> +   template <typename _class, typename _data>
> >> +@@ -280,7 +280,7 @@ namespace Elf
> >> +
> >> +         version_requirement_entry_data (Vernaux *, const
> version_requirement &) throw ();
> >> +
> >> +-        void update_string(const section_type<section_type_STRTAB> &)
> throw (std::bad_alloc);
> >> ++        void update_string(const section_type<section_type_STRTAB> &);
> >> +     };
> >> + }
> >> +
> >> diff --git a/meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb
> b/meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb
> >> index 1784af1f4c..8ecdb17be3 100644
> >> --- a/meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb
> >> +++ b/meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb
> >> @@ -12,6 +12,7 @@ SRC_URI = "
> http://snapshot.debian.org/archive/debian/20180828T214102Z/pool/main/
> >>         file://avoid-failure-on-symbol-provided-by-application.patch \
> >>         file://show-GNU-unique-symbols-as-provided-symbols.patch \
> >>         file://fix_cross_compile.patch \
> >> +       file://no-dynamic-exception-specifications.patch \
> >>  "
> >>
> >>  SRC_URI[md5sum] = "6b6eeb9b4016c6a7317acc28c89e32cc"
> >>
> >>
> >>
> >>
> >>
> >>
> >>
>
> 
>
>

--000000000000d5c5fa05c28bebea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>FWIW, I have had patches to drop mklibs for a long ti=
me:</div><div><a href=3D"http://git.yoctoproject.org/cgit.cgi/poky-contrib/=
log/?h=3Dakanavin/package-version-updates-later">http://git.yoctoproject.or=
g/cgit.cgi/poky-contrib/log/?h=3Dakanavin/package-version-updates-later</a>=
</div><div><br></div><div>I&#39;d be happy to send them again.</div><div><b=
r></div><div>Alex</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Mon, 17 May 2021 at 21:50, Mark Hatle &lt;<a href=
=
=3D"mailto:mark.hatle@kernel.crashing.org">mark.hatle@kernel.crashing.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
br>
<br>
On 5/17/21 2:46 PM, Andre McCurdy wrote:<br>
&gt; On Mon, May 17, 2021 at 10:05 AM Jacob Kroon &lt;<a href=3D"mailto:ja=
cob.kroon@gmail.com" target=3D"_blank">jacob.kroon@gmail.com</a>&gt; wrote:=
<br>
&gt;&gt;<br>
&gt;&gt; In gcc 11 the default mode for C++ is now -std=3Dgnu++17 instead =
of -std=3Dgnu++14,<br>
&gt;&gt; in which support for dynamic exception specifications has been re=
moved.<br>
&gt; <br>
&gt; As much as I&#39;d like to see mklibs fully supported in OE, at some =
point<br>
&gt; maybe we should just admit that it doesn&#39;t work and there&#39;s n=
ot enough<br>
&gt; collective motivation to fix it.<br>
&gt; <br>
&gt; For mklibs to work, the build process should generate a PIC .a archiv=
e<br>
&gt; for every .so shared library (ie static libs need to be built and<br>
&gt; somehow forced to contain PIC object code - which may mean patching<b=
r>
&gt; Makefiles etc) and then the PIC .a files need to be available<br>
&gt; alongside the .so libs when mklibs runs. We don&#39;t have any suppor=
t for<br>
&gt; doing that, so why keep pretending to support mklibs?<br>
<br>
We used to have exactly that.=C2=A0 The fact nobody is complaining it does=
n&#39;t work<br>
tells me nobody is using this and we should remove it.<br>
<br>
The need for this on modern (embedded) systems is significantly less with =
a<br>
function altnerative to glibc.=C2=A0 (musl)<br>
<br>
--Mark<br>
<br>
&gt;&gt; See <a href=3D"http://www.open-std.org/jtc1/sc22/wg21/docs/papers=
/2016/p0003r5.html" rel=3D"noreferrer" target=3D"_blank">http://www.open-st=
d.org/jtc1/sc22/wg21/docs/papers/2016/p0003r5.html</a><br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Jacob Kroon &lt;<a href=3D"mailto:jacob.kroon@gmai=
l.com" target=3D"_blank">jacob.kroon@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 .../no-dynamic-exception-specifications.patch | 420 +++++++=
+++++++++++<br>
&gt;&gt;=C2=A0 .../mklibs/<a href=3D"http://mklibs-native_0.1.44.bb" rel=
=3D"noreferrer" target=3D"_blank">mklibs-native_0.1.44.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;&gt;=C2=A0 2 files changed, 421 insertions(+)<br>
&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/mklibs/files/no-dy=
namic-exception-specifications.patch<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-devtools/mklibs/files/no-dynamic-except=
ion-specifications.patch b/meta/recipes-devtools/mklibs/files/no-dynamic-ex=
ception-specifications.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..5989a67c4f<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-devtools/mklibs/files/no-dynamic-exception-spe=
cifications.patch<br>
&gt;&gt; @@ -0,0 +1,420 @@<br>
&gt;&gt; +In gcc 11 the default mode for C++ is now -std=3Dgnu++17 instead=
 of -std=3Dgnu++14,<br>
&gt;&gt; +in which support for dynamic exception specifications has been r=
emoved.<br>
&gt;&gt; +<br>
&gt;&gt; +See <a href=3D"http://www.open-std.org/jtc1/sc22/wg21/docs/paper=
s/2016/p0003r5.html" rel=3D"noreferrer" target=3D"_blank">http://www.open-s=
td.org/jtc1/sc22/wg21/docs/papers/2016/p0003r5.html</a><br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-Status: Pending<br>
&gt;&gt; +<br>
&gt;&gt; +Signed-off-by: Jacob Kroon &lt;<a href=3D"mailto:jacob.kroon@gma=
il.com" target=3D"_blank">jacob.kroon@gmail.com</a>&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +Index: mklibs-0.1.44/src/mklibs-readelf/elf.cpp<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- mklibs-0.1.44.orig/src/mklibs-readelf/elf.cpp<br>
&gt;&gt; ++++ mklibs-0.1.44/src/mklibs-readelf/elf.cpp<br>
&gt;&gt; +@@ -36,7 +36,7 @@ file::~file () throw ()<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0delete *it;<br>
&gt;&gt; + }<br>
&gt;&gt; +<br>
&gt;&gt; +-file *file::open (const char *filename) throw (std::bad_alloc, =
std::runtime_error)<br>
&gt;&gt; ++file *file::open (const char *filename)<br>
&gt;&gt; + {<br>
&gt;&gt; +=C2=A0 =C2=A0struct stat buf;<br>
&gt;&gt; +=C2=A0 =C2=A0int fd;<br>
&gt;&gt; +@@ -72,7 +72,7 @@ file *file::open (const char *filename)<br>
&gt;&gt; + }<br>
&gt;&gt; +<br>
&gt;&gt; + template&lt;typename _class&gt;<br>
&gt;&gt; +-file *file::open_class(uint8_t *mem, size_t len) throw (std::ba=
d_alloc, std::runtime_error)<br>
&gt;&gt; ++file *file::open_class(uint8_t *mem, size_t len)<br>
&gt;&gt; + {<br>
&gt;&gt; +=C2=A0 =C2=A0switch (mem[EI_DATA])<br>
&gt;&gt; +=C2=A0 =C2=A0{<br>
&gt;&gt; +@@ -86,7 +86,7 @@ file *file::open_class(uint8_t *mem, siz<br>
&gt;&gt; + }<br>
&gt;&gt; +<br>
&gt;&gt; + template &lt;typename _class, typename _data&gt;<br>
&gt;&gt; +-file_data&lt;_class, _data&gt;::file_data(uint8_t *mem, size_t =
len) throw (std::bad_alloc, std::runtime_error)<br>
&gt;&gt; ++file_data&lt;_class, _data&gt;::file_data(uint8_t *mem, size_t =
len)<br>
&gt;&gt; + : file(mem, len)<br>
&gt;&gt; + {<br>
&gt;&gt; +=C2=A0 =C2=A0if (mem[EI_CLASS] !=3D _class::id)<br>
&gt;&gt; +@@ -190,7 +190,7 @@ section_data&lt;_class, _data&gt;::section_d=
at<br>
&gt;&gt; + }<br>
&gt;&gt; +<br>
&gt;&gt; + template &lt;typename _class, typename _data&gt;<br>
&gt;&gt; +-void section_data&lt;_class, _data&gt;::update(const file &amp;=
file) throw (std::bad_alloc)<br>
&gt;&gt; ++void section_data&lt;_class, _data&gt;::update(const file &amp;=
file)<br>
&gt;&gt; + {<br>
&gt;&gt; +=C2=A0 =C2=A0const section_type&lt;section_type_STRTAB&gt; &amp;=
section =3D<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0dynamic_cast&lt;const section_type&lt;sectio=
n_type_STRTAB&gt; &amp;&gt;(file.get_section(file.get_shstrndx()));<br>
&gt;&gt; +@@ -204,7 +204,7 @@ section_type&lt;section_type_DYNAMIC&gt;::~s=
ec<br>
&gt;&gt; + }<br>
&gt;&gt; +<br>
&gt;&gt; + template &lt;typename _class, typename _data&gt;<br>
&gt;&gt; +-section_real&lt;_class, _data, section_type_DYNAMIC&gt;::sectio=
n_real(Shdr *header, uint8_t *mem) throw (std::bad_alloc)<br>
&gt;&gt; ++section_real&lt;_class, _data, section_type_DYNAMIC&gt;::sectio=
n_real(Shdr *header, uint8_t *mem)<br>
&gt;&gt; + : section_data&lt;_class, _data&gt;(header, mem)<br>
&gt;&gt; + {<br>
&gt;&gt; +=C2=A0 =C2=A0if (this-&gt;type !=3D SHT_DYNAMIC)<br>
&gt;&gt; +@@ -221,7 +221,7 @@ section_real&lt;_class, _data, section_type<=
br>
&gt;&gt; + }<br>
&gt;&gt; +<br>
&gt;&gt; + template &lt;typename _class, typename _data&gt;<br>
&gt;&gt; +-void section_real&lt;_class, _data, section_type_DYNAMIC&gt;::u=
pdate(const file &amp;file) throw (std::bad_alloc)<br>
&gt;&gt; ++void section_real&lt;_class, _data, section_type_DYNAMIC&gt;::u=
pdate(const file &amp;file)<br>
&gt;&gt; + {<br>
&gt;&gt; +=C2=A0 =C2=A0section_data&lt;_class, _data&gt;::update(file);<br=
>
&gt;&gt; +<br>
&gt;&gt; +@@ -243,7 +243,7 @@ section_type&lt;section_type_DYNSYM&gt;::~se=
ct<br>
&gt;&gt; + }<br>
&gt;&gt; +<br>
&gt;&gt; + template &lt;typename _class, typename _data&gt;<br>
&gt;&gt; +-section_real&lt;_class, _data, section_type_DYNSYM&gt;::section=
_real(Shdr *header, uint8_t *mem) throw (std::bad_alloc)<br>
&gt;&gt; ++section_real&lt;_class, _data, section_type_DYNSYM&gt;::section=
_real(Shdr *header, uint8_t *mem)<br>
&gt;&gt; + : section_data&lt;_class, _data&gt;(header, mem)<br>
&gt;&gt; + {<br>
&gt;&gt; +=C2=A0 =C2=A0if (this-&gt;type !=3D SHT_DYNSYM)<br>
&gt;&gt; +@@ -260,7 +260,7 @@ section_real&lt;_class, _data, section_type<=
br>
&gt;&gt; + }<br>
&gt;&gt; +<br>
&gt;&gt; + template &lt;typename _class, typename _data&gt;<br>
&gt;&gt; +-void section_real&lt;_class, _data, section_type_DYNSYM&gt;::up=
date(const file &amp;file) throw (std::bad_alloc)<br>
&gt;&gt; ++void section_real&lt;_class, _data, section_type_DYNSYM&gt;::up=
date(const file &amp;file)<br>
&gt;&gt; + {<br>
&gt;&gt; +=C2=A0 =C2=A0section_data&lt;_class, _data&gt;::update (file);<b=
r>
&gt;&gt; +<br>
&gt;&gt; +@@ -285,7 +285,7 @@ const version_definition *section_type&lt;s<=
br>
&gt;&gt; + }<br>
&gt;&gt; +<br>
&gt;&gt; + template &lt;typename _class, typename _data&gt;<br>
&gt;&gt; +-section_real&lt;_class, _data, section_type_GNU_VERDEF&gt;::sec=
tion_real(Shdr *header, uint8_t *mem) throw (std::bad_alloc)<br>
&gt;&gt; ++section_real&lt;_class, _data, section_type_GNU_VERDEF&gt;::sec=
tion_real(Shdr *header, uint8_t *mem)<br>
&gt;&gt; + : section_data&lt;_class, _data&gt;(header, mem)<br>
&gt;&gt; + {<br>
&gt;&gt; +=C2=A0 =C2=A0if (this-&gt;type !=3D SHT_GNU_verdef)<br>
&gt;&gt; +@@ -307,7 +307,7 @@ section_real&lt;_class, _data, section_type<=
br>
&gt;&gt; + }<br>
&gt;&gt; +<br>
&gt;&gt; + template &lt;typename _class, typename _data&gt;<br>
&gt;&gt; +-void section_real&lt;_class, _data, section_type_GNU_VERDEF&gt;=
::update(const file &amp;file) throw (std::bad_alloc)<br>
&gt;&gt; ++void section_real&lt;_class, _data, section_type_GNU_VERDEF&gt;=
::update(const file &amp;file)<br>
&gt;&gt; + {<br>
&gt;&gt; +=C2=A0 =C2=A0section_data&lt;_class, _data&gt;::update(file);<br=
>
&gt;&gt; +<br>
&gt;&gt; +@@ -333,7 +333,7 @@ const version_requirement_entry *section<br>
&gt;&gt; +<br>
&gt;&gt; + template &lt;typename _class, typename _data&gt;<br>
&gt;&gt; + section_real&lt;_class, _data, section_type_GNU_VERNEED&gt;::<b=
r>
&gt;&gt; +-section_real(Shdr *header, uint8_t *mem) throw (std::bad_alloc)=
<br>
&gt;&gt; ++section_real(Shdr *header, uint8_t *mem)<br>
&gt;&gt; + : section_data&lt;_class, _data&gt; (header, mem)<br>
&gt;&gt; + {<br>
&gt;&gt; +=C2=A0 =C2=A0if (this-&gt;type !=3D SHT_GNU_verneed)<br>
&gt;&gt; +@@ -355,7 +355,7 @@ section_real(Shdr *header, uint8_t *mem)<br>
&gt;&gt; + }<br>
&gt;&gt; +<br>
&gt;&gt; + template &lt;typename _class, typename _data&gt;<br>
&gt;&gt; +-void section_real&lt;_class, _data, section_type_GNU_VERNEED&gt=
;::update(const file &amp;file) throw (std::bad_alloc)<br>
&gt;&gt; ++void section_real&lt;_class, _data, section_type_GNU_VERNEED&gt=
;::update(const file &amp;file)<br>
&gt;&gt; + {<br>
&gt;&gt; +=C2=A0 =C2=A0section_data&lt;_class, _data&gt;::update(file);<br=
>
&gt;&gt; +<br>
&gt;&gt; +@@ -372,7 +372,7 @@ void section_real&lt;_class, _data, section<=
br>
&gt;&gt; +<br>
&gt;&gt; + template &lt;typename _class, typename _data&gt;<br>
&gt;&gt; + section_real&lt;_class, _data, section_type_GNU_VERSYM&gt;::<br=
>
&gt;&gt; +-section_real (Shdr *header, uint8_t *mem) throw (std::bad_alloc=
)<br>
&gt;&gt; ++section_real (Shdr *header, uint8_t *mem)<br>
&gt;&gt; + : section_data&lt;_class, _data&gt; (header, mem)<br>
&gt;&gt; + {<br>
&gt;&gt; +=C2=A0 =C2=A0if (this-&gt;type !=3D SHT_GNU_versym)<br>
&gt;&gt; +@@ -399,7 +399,7 @@ segment_data&lt;_class, _data&gt;::segment_d=
at<br>
&gt;&gt; + }<br>
&gt;&gt; +<br>
&gt;&gt; + template &lt;typename _class, typename _data&gt;<br>
&gt;&gt; +-segment_real&lt;_class, _data, segment_type_INTERP&gt;::segment=
_real (Phdr *header, uint8_t *mem) throw (std::bad_alloc)<br>
&gt;&gt; ++segment_real&lt;_class, _data, segment_type_INTERP&gt;::segment=
_real (Phdr *header, uint8_t *mem)<br>
&gt;&gt; + : segment_data&lt;_class, _data&gt; (header, mem)<br>
&gt;&gt; + {<br>
&gt;&gt; +=C2=A0 =C2=A0if (this-&gt;type !=3D PT_INTERP)<br>
&gt;&gt; +@@ -429,13 +429,13 @@ dynamic_data&lt;_class, _data&gt;::dynamic=
_dat<br>
&gt;&gt; + }<br>
&gt;&gt; +<br>
&gt;&gt; + template &lt;typename _class, typename _data&gt;<br>
&gt;&gt; +-void dynamic_data&lt;_class, _data&gt;::update_string(const sec=
tion_type&lt;section_type_STRTAB&gt; &amp;section) throw (std::bad_alloc)<b=
r>
&gt;&gt; ++void dynamic_data&lt;_class, _data&gt;::update_string(const sec=
tion_type&lt;section_type_STRTAB&gt; &amp;section)<br>
&gt;&gt; + {<br>
&gt;&gt; +=C2=A0 =C2=A0if (is_string)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0val_string =3D section.get_string(val);<br>
&gt;&gt; + }<br>
&gt;&gt; +<br>
&gt;&gt; +-std::string symbol::get_version () const throw (std::bad_alloc)=
<br>
&gt;&gt; ++std::string symbol::get_version () const<br>
&gt;&gt; + {<br>
&gt;&gt; +=C2=A0 =C2=A0if (verneed)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0return verneed-&gt;get_name();<br>
&gt;&gt; +@@ -445,7 +445,7 @@ std::string symbol::get_version () const<br>
&gt;&gt; +=C2=A0 =C2=A0return &quot;Base&quot;;<br>
&gt;&gt; + }<br>
&gt;&gt; +<br>
&gt;&gt; +-std::string symbol::get_version_file () const throw (std::bad_a=
lloc)<br>
&gt;&gt; ++std::string symbol::get_version_file () const<br>
&gt;&gt; + {<br>
&gt;&gt; +=C2=A0 =C2=A0if (verneed)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0return verneed-&gt;get_file();<br>
&gt;&gt; +@@ -453,7 +453,7 @@ std::string symbol::get_version_file ()<br>
&gt;&gt; +=C2=A0 =C2=A0return &quot;None&quot;;<br>
&gt;&gt; + }<br>
&gt;&gt; +<br>
&gt;&gt; +-std::string symbol::get_name_version () const throw (std::bad_a=
lloc)<br>
&gt;&gt; ++std::string symbol::get_name_version () const<br>
&gt;&gt; + {<br>
&gt;&gt; +=C2=A0 =C2=A0std::string ver;<br>
&gt;&gt; +<br>
&gt;&gt; +@@ -478,13 +478,13 @@ symbol_data&lt;_class, _data&gt;::symbol_d=
ata<br>
&gt;&gt; + }<br>
&gt;&gt; +<br>
&gt;&gt; + template &lt;typename _class, typename _data&gt;<br>
&gt;&gt; +-void symbol_data&lt;_class, _data&gt;::update_string(const sect=
ion_type&lt;section_type_STRTAB&gt; &amp;section) throw (std::bad_alloc)<br=
>
&gt;&gt; ++void symbol_data&lt;_class, _data&gt;::update_string(const sect=
ion_type&lt;section_type_STRTAB&gt; &amp;section)<br>
&gt;&gt; + {<br>
&gt;&gt; +=C2=A0 =C2=A0name_string =3D section.get_string(name);<br>
&gt;&gt; + }<br>
&gt;&gt; +<br>
&gt;&gt; + template &lt;typename _class, typename _data&gt;<br>
&gt;&gt; +-void symbol_data&lt;_class, _data&gt;::update_version(const fil=
e &amp;file, uint16_t index) throw (std::bad_alloc)<br>
&gt;&gt; ++void symbol_data&lt;_class, _data&gt;::update_version(const fil=
e &amp;file, uint16_t index)<br>
&gt;&gt; + {<br>
&gt;&gt; +=C2=A0 =C2=A0if (!file.get_section_GNU_VERSYM())<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0return;<br>
&gt;&gt; +@@ -531,13 +531,13 @@ version_definition_data&lt;_class, _data&g=
t;::<br>
&gt;&gt; + }<br>
&gt;&gt; +<br>
&gt;&gt; + template &lt;typename _class, typename _data&gt;<br>
&gt;&gt; +-void version_definition_data&lt;_class, _data&gt;::update_strin=
g(const section_type&lt;section_type_STRTAB&gt; &amp;section) throw (std::b=
ad_alloc)<br>
&gt;&gt; ++void version_definition_data&lt;_class, _data&gt;::update_strin=
g(const section_type&lt;section_type_STRTAB&gt; &amp;section)<br>
&gt;&gt; + {<br>
&gt;&gt; +=C2=A0 =C2=A0for (std::vector&lt;uint32_t&gt;::iterator it =3D n=
ames.begin(); it !=3D names.end(); ++it)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0names_string.push_back(section.get_string(*i=
t));<br>
&gt;&gt; + }<br>
&gt;&gt; +<br>
&gt;&gt; +-version_requirement::version_requirement() throw (std::bad_allo=
c)<br>
&gt;&gt; ++version_requirement::version_requirement()<br>
&gt;&gt; + : file_string(&quot;None&quot;)<br>
&gt;&gt; + { }<br>
&gt;&gt; +<br>
&gt;&gt; +@@ -561,7 +561,7 @@ version_requirement_data&lt;_class, _data&gt=
;:<br>
&gt;&gt; +<br>
&gt;&gt; + template &lt;typename _class, typename _data&gt;<br>
&gt;&gt; + void version_requirement_data&lt;_class, _data&gt;::<br>
&gt;&gt; +-update_string(const section_type&lt;section_type_STRTAB&gt; &am=
p;section) throw (std::bad_alloc)<br>
&gt;&gt; ++update_string(const section_type&lt;section_type_STRTAB&gt; &am=
p;section)<br>
&gt;&gt; + {<br>
&gt;&gt; +=C2=A0 =C2=A0file_string =3D section.get_string(file);<br>
&gt;&gt; +<br>
&gt;&gt; +@@ -596,7 +596,7 @@ version_requirement_entry_data(Vernaux *<br>
&gt;&gt; +<br>
&gt;&gt; + template &lt;typename _class, typename _data&gt;<br>
&gt;&gt; + void version_requirement_entry_data&lt;_class, _data&gt;::<br>
&gt;&gt; +-update_string(const section_type&lt;section_type_STRTAB&gt; &am=
p;section) throw (std::bad_alloc)<br>
&gt;&gt; ++update_string(const section_type&lt;section_type_STRTAB&gt; &am=
p;section)<br>
&gt;&gt; + {<br>
&gt;&gt; +=C2=A0 =C2=A0name_string =3D section.get_string(name);<br>
&gt;&gt; + }<br>
&gt;&gt; +Index: mklibs-0.1.44/src/mklibs-readelf/elf.hpp<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- mklibs-0.1.44.orig/src/mklibs-readelf/elf.hpp<br>
&gt;&gt; ++++ mklibs-0.1.44/src/mklibs-readelf/elf.hpp<br>
&gt;&gt; +@@ -49,7 +49,7 @@ namespace Elf<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const uint16_t get_shstrndx() const t=
hrow () { return shstrndx; }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const std::vector&lt;section *&gt; ge=
t_sections() const throw () { return sections; };<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 const section &amp;get_section(unsigned in=
t i) const throw (std::out_of_range) { return *<a href=3D"http://sections.a=
t" rel=3D"noreferrer" target=3D"_blank">sections.at</a>(i); };<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 const section &amp;get_section(unsigned in=
t i) const { return *<a href=3D"http://sections.at" rel=3D"noreferrer" targ=
et=3D"_blank">sections.at</a>(i); };<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const section_type&lt;section_type_DY=
NAMIC&gt; *get_section_DYNAMIC() const throw () { return section_DYNAMIC; }=
;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const section_type&lt;section_type_DY=
NSYM&gt; *get_section_DYNSYM() const throw () { return section_DYNSYM; };<b=
r>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const section_type&lt;section_type_GN=
U_VERDEF&gt; *get_section_GNU_VERDEF() const throw () { return section_GNU_=
VERDEF; };<br>
&gt;&gt; +@@ -59,13 +59,13 @@ namespace Elf<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const std::vector&lt;segment *&gt; ge=
t_segments() const throw () { return segments; };<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const segment_type&lt;segment_type_IN=
TERP&gt; *get_segment_INTERP() const throw () { return segment_INTERP; };<b=
r>
&gt;&gt; +<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 static file *open(const char *filename) th=
row (std::bad_alloc, std::runtime_error);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 static file *open(const char *filename);<b=
r>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0protected:<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 file(uint8_t *mem, size_t len) throw (std:=
:bad_alloc) : mem(mem), len(len) { }<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 file(uint8_t *mem, size_t len) : mem(mem),=
 len(len) { }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0template&lt;typename _class&gt;<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 static file *open_class(uint8_t *, =
size_t) throw (std::bad_alloc, std::runtime_error);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 static file *open_class(uint8_t *, =
size_t);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint16_t type;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint16_t machine;<br>
&gt;&gt; +@@ -128,7 +128,7 @@ namespace Elf<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0class section_type&lt;section_type_STRTAB&gt=
; : public virtual section<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0public:<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 std::string get_string(uint32_t off=
set) const throw (std::bad_alloc)<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 std::string get_string(uint32_t off=
set) const<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return std::string(rein=
terpret_cast&lt;const char *&gt; (mem + offset));<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +@@ -263,10 +263,10 @@ namespace Elf<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t get_bind () const throw () { =
return bind; }<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t get_type () const throw () { =
return type; }<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const std::string &amp;get_name_strin=
g() const throw () { return name_string; }<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 std::string get_version() const throw (std=
::bad_alloc);<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 std::string get_version_file() const throw=
 (std::bad_alloc);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 std::string get_version() const;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 std::string get_version_file() const;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint16_t get_version_data() const thr=
ow () { return versym; }<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 std::string get_name_version() const throw=
 (std::bad_alloc);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 std::string get_name_version() const;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0protected:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t name;<br>
&gt;&gt; +@@ -305,7 +305,7 @@ namespace Elf<br>
&gt;&gt; +=C2=A0 =C2=A0class version_requirement<br>
&gt;&gt; +=C2=A0 =C2=A0{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0public:<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 version_requirement() throw (std::bad_allo=
c);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 version_requirement();<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0virtual ~version_requirement () throw=
 () { }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const std::string &amp;get_file() con=
st throw () { return file_string; }<br>
&gt;&gt; +Index: mklibs-0.1.44/src/mklibs-readelf/elf_data.hpp<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- mklibs-0.1.44.orig/src/mklibs-readelf/elf_data.hpp<br>
&gt;&gt; ++++ mklibs-0.1.44/src/mklibs-readelf/elf_data.hpp<br>
&gt;&gt; +@@ -94,7 +94,7 @@ namespace Elf<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0class file_data : public file<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0public:<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 file_data(uint8_t *, size_t len) th=
row (std::bad_alloc, std::runtime_error);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 file_data(uint8_t *, size_t len);<b=
r>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const uint8_t get_class() cons=
t throw () { return _class::id; }<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const uint8_t get_data() const=
 throw () { return _data::id; }<br>
&gt;&gt; +@@ -109,7 +109,7 @@ namespace Elf<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0public:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0section_data(Shdr *, uint8_t *=
) throw ();<br>
&gt;&gt; +<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 virtual void update(const file &amp=
;) throw (std::bad_alloc);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 virtual void update(const file &amp=
;);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0template &lt;typename _class, typename _data, typen=
ame _type&gt;<br>
&gt;&gt; +@@ -133,9 +133,9 @@ namespace Elf<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0typedef typename _elfdef&lt;_c=
lass&gt;::Shdr Shdr;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0public:<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 section_real(Shdr *, uint8_t *) thr=
ow (std::bad_alloc);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 section_real(Shdr *, uint8_t *);<br=
>
&gt;&gt; +<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 void update(const file &amp;) throw=
 (std::bad_alloc);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 void update(const file &amp;);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0template &lt;typename _class, typename _data&gt;<br=
>
&gt;&gt; +@@ -147,9 +147,9 @@ namespace Elf<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0typedef typename _elfdef&lt;_c=
lass&gt;::Shdr Shdr;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0public:<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 section_real(Shdr *, uint8_t *) thr=
ow (std::bad_alloc);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 section_real(Shdr *, uint8_t *);<br=
>
&gt;&gt; +<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 void update(const file &amp;) throw=
 (std::bad_alloc);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 void update(const file &amp;);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0template &lt;typename _class, typename _data&gt;<br=
>
&gt;&gt; +@@ -161,9 +161,9 @@ namespace Elf<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0typedef typename _elfdef&lt;_c=
lass&gt;::Shdr Shdr;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0public:<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 section_real(Shdr *, uint8_t *) thr=
ow (std::bad_alloc);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 section_real(Shdr *, uint8_t *);<br=
>
&gt;&gt; +<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 void update(const file &amp;) throw=
 (std::bad_alloc);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 void update(const file &amp;);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0template &lt;typename _class, typename _data&gt;<br=
>
&gt;&gt; +@@ -175,9 +175,9 @@ namespace Elf<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0typedef typename _elfdef&lt;_c=
lass&gt;::Shdr Shdr;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0public:<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 section_real(Shdr *, uint8_t *) thr=
ow (std::bad_alloc);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 section_real(Shdr *, uint8_t *);<br=
>
&gt;&gt; +<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 void update(const file &amp;) throw=
 (std::bad_alloc);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 void update(const file &amp;);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0template &lt;typename _class, typename _data&gt;<br=
>
&gt;&gt; +@@ -189,7 +189,7 @@ namespace Elf<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0typedef typename _elfdef&lt;_c=
lass&gt;::Shdr Shdr;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0public:<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 section_real(Shdr *, uint8_t *) thr=
ow (std::bad_alloc);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 section_real(Shdr *, uint8_t *);<br=
>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0template &lt;typename _class, typename _data&gt;<br=
>
&gt;&gt; +@@ -220,7 +220,7 @@ namespace Elf<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0typedef typename _elfdef&lt;_c=
lass&gt;::Phdr Phdr;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0public:<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 segment_real (Phdr *, uint8_t *) th=
row (std::bad_alloc);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 segment_real (Phdr *, uint8_t *);<b=
r>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0template &lt;typename _class, typename _data&gt;<br=
>
&gt;&gt; +@@ -232,7 +232,7 @@ namespace Elf<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0public:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dynamic_data (Dyn *) throw ();=
<br>
&gt;&gt; +<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 void update_string(const section_ty=
pe&lt;section_type_STRTAB&gt; &amp;) throw (std::bad_alloc);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 void update_string(const section_ty=
pe&lt;section_type_STRTAB&gt; &amp;);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0template &lt;typename _class, typename _data&gt;<br=
>
&gt;&gt; +@@ -244,8 +244,8 @@ namespace Elf<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0public:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0symbol_data (Sym *) throw ();<=
br>
&gt;&gt; +<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 void update_string(const section_ty=
pe&lt;section_type_STRTAB&gt; &amp;) throw (std::bad_alloc);<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 virtual void update_version (const =
file &amp;, uint16_t) throw (std::bad_alloc);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 void update_string(const section_ty=
pe&lt;section_type_STRTAB&gt; &amp;);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 virtual void update_version (const =
file &amp;, uint16_t);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0template &lt;typename _class, typename _data&gt;<br=
>
&gt;&gt; +@@ -257,7 +257,7 @@ namespace Elf<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0version_definition_data (Verde=
f *) throw ();<br>
&gt;&gt; +<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 void update_string(const section_ty=
pe&lt;section_type_STRTAB&gt; &amp;) throw (std::bad_alloc);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 void update_string(const section_ty=
pe&lt;section_type_STRTAB&gt; &amp;);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0template &lt;typename _class, typename _data&gt;<br=
>
&gt;&gt; +@@ -269,7 +269,7 @@ namespace Elf<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0version_requirement_data (Vern=
eed *) throw ();<br>
&gt;&gt; +<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 void update_string(const section_ty=
pe&lt;section_type_STRTAB&gt; &amp;) throw (std::bad_alloc);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 void update_string(const section_ty=
pe&lt;section_type_STRTAB&gt; &amp;);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0template &lt;typename _class, typename _data&gt;<br=
>
&gt;&gt; +@@ -280,7 +280,7 @@ namespace Elf<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0version_requirement_entry_data=
 (Vernaux *, const version_requirement &amp;) throw ();<br>
&gt;&gt; +<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 void update_string(const section_ty=
pe&lt;section_type_STRTAB&gt; &amp;) throw (std::bad_alloc);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 void update_string(const section_ty=
pe&lt;section_type_STRTAB&gt; &amp;);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt; + }<br>
&gt;&gt; +<br>
&gt;&gt; diff --git a/meta/recipes-devtools/mklibs/<a href=3D"http://mklib=
s-native_0.1.44.bb" rel=3D"noreferrer" target=3D"_blank">mklibs-native_0.1.=
44.bb</a> b/meta/recipes-devtools/mklibs/<a href=3D"http://mklibs-native_0.=
1.44.bb" rel=3D"noreferrer" target=3D"_blank">mklibs-native_0.1.44.bb</a><b=
r>
&gt;&gt; index 1784af1f4c..8ecdb17be3 100644<br>
&gt;&gt; --- a/meta/recipes-devtools/mklibs/<a href=3D"http://mklibs-nativ=
e_0.1.44.bb" rel=3D"noreferrer" target=3D"_blank">mklibs-native_0.1.44.bb</=
a><br>
&gt;&gt; +++ b/meta/recipes-devtools/mklibs/<a href=3D"http://mklibs-nativ=
e_0.1.44.bb" rel=3D"noreferrer" target=3D"_blank">mklibs-native_0.1.44.bb</=
a><br>
&gt;&gt; @@ -12,6 +12,7 @@ SRC_URI =3D &quot;<a href=3D"http://snapshot.de=
bian.org/archive/debian/20180828T214102Z/pool/main/" rel=3D"noreferrer" tar=
get=3D"_blank">http://snapshot.debian.org/archive/debian/20180828T214102Z/p=
ool/main/</a><br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://avoid-failure-on-symbol-p=
rovided-by-application.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://show-GNU-unique-symbols-a=
s-provided-symbols.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix_cross_compile.patch \=
<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0file://no-dynamic-exception-specifica=
tions.patch \<br>
&gt;&gt;=C2=A0 &quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 SRC_URI[md5sum] =3D &quot;6b6eeb9b4016c6a7317acc28c89e32cc&=
quot;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt;<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000d5c5fa05c28bebea--
